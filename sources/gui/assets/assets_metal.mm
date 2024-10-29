#include "assets_metal.hpp"

#define STB_IMAGE_IMPLEMENTATION
#include "stb/stb_image.h"

namespace gui {
namespace assets {

assets_metal::assets_metal(id<MTLDevice> device):
    assets(),
    _device{device}
{
}

bool assets_metal::load_image(const char* key, const char* fullPath)
{
    int width = 0;
    int height = 0;
    int numberOfChannels = 0;

    unsigned char* data = stbi_load(fullPath, &width, &height, &numberOfChannels, 0);
    
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
        _image_inventory[key] = texture;

        return true;
    }
    
    return false;
}


ImTextureID assets_metal::get_image(const char* key)
{
    return (ImTextureID)_image_inventory[key];
}

} // assets
} // gui

