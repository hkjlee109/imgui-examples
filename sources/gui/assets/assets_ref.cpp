#include "assets_ref.hpp"

namespace gui {
namespace assets {

assets* assets_ref::_instance = nullptr;

assets_ref::assets_ref(assets* instance)
{
    _instance = instance;
}

assets* assets_ref::get_instance()
{
    return _instance;
}

} // assets
} // gui
