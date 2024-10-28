#include "main_menu.hpp"

#include "imgui.h"

namespace gui {

void draw_main_menu()
{
    ImGui::BeginChild(
        "main_menu",
        ImVec2(60, ImGui::GetContentRegionAvail().y),
        ImGuiChildFlags_None,
        ImGuiWindowFlags_None
    );
    
    ImGui::EndChild();
}

} // gui
