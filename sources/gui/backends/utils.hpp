#pragma once

#include "imgui.h"

namespace gui {
namespace backends {

class utils
{
public:
    utils(){};
    virtual ImTextureID load_image(const char* filename) = 0;
};

} // backends
} // gui
