#pragma once

#include "assets.hpp"

namespace gui {
namespace assets {

class assets_ref
{
public:
    assets_ref(assets* _instance);
    static assets* get_instance();

private:
    static assets* _instance;
};

} // assets
} // gui
