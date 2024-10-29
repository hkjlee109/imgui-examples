#import "ViewController.h"
#import <MetalKit/MetalKit.h>

#include "imgui/backends/imgui_impl_metal.h"
#include "imgui/backends/imgui_impl_osx.h"

#include "gui/main_window.hpp"
#include "gui/assets/assets_metal.hpp"
#include "gui/assets/assets_ref.hpp"

#include <memory>

@interface ViewController () <MTKViewDelegate> {
    
    std::unique_ptr<gui::main_window> _main_window;
    bool _open_main_window;
    
}

@property (nonatomic, strong) id<MTLDevice> device;
@property (nonatomic, strong) id<MTLCommandQueue> commandQueue;

@end

@implementation ViewController

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    self.device = MTLCreateSystemDefaultDevice();
    self.commandQueue = [self.device newCommandQueue];
    
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;
    io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard;
    io.ConfigFlags |= ImGuiConfigFlags_NavEnableGamepad;
    
    ImGui::StyleColorsDark();
    
    ImGui_ImplMetal_Init(self.metalLayer.device);
    
    return self;
}

- (MTKView*)mtkView {
    return (MTKView*)self.view;
}

- (CAMetalLayer*)metalLayer {
    return (CAMetalLayer*)self.mtkView.layer;
}

- (void)loadView {
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, 720, 480)];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mtkView.delegate = self;
    self.mtkView.device = self.device;
    self.mtkView.preferredFramesPerSecond = 7;
    
    ImGui_ImplOSX_Init(self.view);
    
    _open_main_window = true;
    _main_window = std::make_unique<gui::main_window>(&_open_main_window);
    
    gui::assets::assets_metal* assets{new gui::assets::assets_metal(self.device)};

    assets->load_image(
        "home",
        [[NSBundle mainBundle] pathForResource:@"home" ofType:@"png"].UTF8String
    );
    
    gui::assets::assets_ref assets_ref(assets);
}

- (void)drawInMTKView:(nonnull MTKView *)view {
    ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;
    
    CGFloat framebufferScale = view.window.screen.backingScaleFactor ?: NSScreen.mainScreen.backingScaleFactor;
    io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
    MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
    if (renderPassDescriptor == nil) {
        [commandBuffer commit];
        return;
    }
    
    ImGui_ImplMetal_NewFrame(renderPassDescriptor);
    ImGui_ImplOSX_NewFrame(view);
    ImGui::NewFrame();
    
    static ImVec4 clear_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);

    ImGuiViewport* viewport = ImGui::GetMainViewport();
    ImGui::SetNextWindowPos(viewport->WorkPos);
    ImGui::SetNextWindowSize(viewport->Size);
    
    _main_window->draw();
    
    ImGui::Render();
    ImDrawData* draw_data = ImGui::GetDrawData();
    
    renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColorMake(
        clear_color.x * clear_color.w,
        clear_color.y * clear_color.w,
        clear_color.z * clear_color.w,
        clear_color.w
    );
    
    id<MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
    [renderEncoder pushDebugGroup:@"Dear ImGui rendering"];
    ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);
    [renderEncoder popDebugGroup];
    [renderEncoder endEncoding];

    [commandBuffer presentDrawable:view.currentDrawable];
    [commandBuffer commit];
}

- (void)mtkView:(nonnull MTKView *)view drawableSizeWillChange:(CGSize)size {
    
}

@end
