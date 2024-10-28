#pragma once

#include "utils.hpp"

#import <MetalKit/MetalKit.h>

namespace gui {
namespace backends {

class utils_metal: public utils
{
public:
    utils_metal(id<MTLDevice> device);
    ImTextureID load_image(const char* filename) override;
    
private:
    id<MTLDevice> _device;
};

} // backends
} // gui
