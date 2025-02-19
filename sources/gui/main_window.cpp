#include "main_window.hpp"
#include "main_menu.hpp"

#include "imgui.h"

namespace gui {

main_window::main_window(bool* open) :
    _open{open}
{
}

void main_window::draw()
{
    ImGui::Begin("main_window", _open, ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_NoResize);
    
    {
        draw_main_menu();
        
        ImGui::SameLine();
    }
    
    ImGui::End();
}

} // gui
