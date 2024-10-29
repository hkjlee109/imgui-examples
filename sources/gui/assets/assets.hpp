#pragma once

#include "imgui.h"

namespace gui {
namespace assets {

class assets
{
public:
    virtual bool load_image(const char* key, const char* fullPath) = 0;
    virtual ImTextureID get_image(const char* key) = 0;
    
    virtual static assets* get_instance() = 0;
};

} // assets
} // gui
