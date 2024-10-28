#include "utils_metal.hpp"

namespace gui {
namespace backends {

utils_metal::utils_metal(id<MTLDevice> device):
    utils(),
    _device{device}
{
}

ImTextureID utils_metal::load_image(const char* filename)
{
    return 0;
}

} // backends
} // gui

