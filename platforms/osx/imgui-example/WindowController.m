#import "WindowController.h"

#import "ViewController.h"

@interface WindowController ()

@end

@implementation WindowController

- (id)init {
    self = [super init];
    if(self) {
        self.window = [[NSWindow alloc] initWithContentRect:NSZeroRect
                                                  styleMask:NSWindowStyleMaskTitled |
                                                            NSWindowStyleMaskClosable |
                                                            NSWindowStyleMaskResizable |
                                                            NSWindowStyleMaskMiniaturizable
                                                    backing:NSBackingStoreBuffered
                                                      defer:NO];
        
        self.window.contentViewController =  [ViewController new];
        [self.window center];
        [self.window makeKeyAndOrderFront:self];
    }
    return self;
}

@end
