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
        
        ImGui::BeginChild(
            "ChildHeader",
            ImVec2(100, 60),
            ImGuiChildFlags_None,
            ImGuiChildFlags_None);
        
        static char buf1[200] = "";
        ImGui::InputText("d",     buf1, 200);
        
//        ImGuiIO& io = ImGui::GetIO();
//        ImTextureID my_tex_id = io.Fonts->TexID;
//        if (ImGui::ImageButton("blah", my_tex_id, ImVec2(400, 80))) {
////            show_another_window = false;
//        }
//        ImGui::SetItemDefaultFocus();
        
        ImGui::EndChild();
    }
    
    ImGui::End();
}

} // gui
