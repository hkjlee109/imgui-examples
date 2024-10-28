#include "gui_main_window.hpp"
#include "gui_main_menu.hpp"

#include "imgui.h"

namespace gui {

gui_main_window::gui_main_window(bool* open) :
    _open{open}
{
}

void gui_main_window::draw()
{
    ImGui::Begin("main_window", _open, ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_NoResize);
    
    {
        draw_main_menu();
        
        ImGui::SameLine();
    }
    
    ImGui::End();
}

} // gui
