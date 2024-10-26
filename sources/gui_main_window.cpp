#include "gui_main_window.hpp"

#include "imgui.h"

namespace gui
{

gui_main_window::gui_main_window(bool* open) :
    _open{open}
{
}

void gui_main_window::draw()
{
    ImGui::Begin("Hello, world!", _open, ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_NoResize);
    
    ImGui::End();
}

} // gui
