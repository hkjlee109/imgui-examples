#include "utils_metal.hpp"

#define STB_IMAGE_IMPLEMENTATION
#include "stb/stb_image.h"

namespace gui {
namespace backends {

utils_metal::utils_metal(id<MTLDevice> device):
    utils(),
    _device{device}
{
}

ImTextureID utils_metal::load_image(const char* filename)
{
    int width = 0;
    int height = 0;
    int numberOfChannels = 0;
    
    unsigned char* data = stbi_load(filename, &width, &height, &numberOfChannels, 0);
    if(data) {
        MTLTextureDescriptor* descriptor =
            [MTLTextureDescriptor texture2DDescriptorWithPixelFormat:MTLPixelFormatRGBA8Unorm
                                                               width:width
                                                              height:height
                                                           mipmapped:NO];
        
        id<MTLTexture> texture = [_device newTextureWithDescriptor:descriptor];

        [texture replaceRegion:MTLRegionMake2D(0, 0, width, height)
                   mipmapLevel:0
                     withBytes:data
                   bytesPerRow:width * numberOfChannels];
        
        stbi_image_free(data);

        return (ImTextureID)texture;
    }
    
    return 0;
}

} // backends
} // gui

