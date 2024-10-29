#pragma once

#include "assets.hpp"
#include <string>
#include <unordered_map>

#import <MetalKit/MetalKit.h>

namespace gui {
namespace assets {

class assets_metal: public assets
{
public:
    assets_metal(id<MTLDevice> device);
    bool load_image(const char* key, const char* fullPath) override;
    ImTextureID get_image(const char* key) override;
    
private:
    __weak id<MTLDevice> _device;
    std::unordered_map<std::string, id<MTLTexture>> _image_inventory;
};

} // assets
} // gui
