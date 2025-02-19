#include "main_menu.hpp"

#include "imgui.h"
#include "gui/assets/assets_ref.hpp"

namespace gui {

void draw_main_menu()
{
    ImGui::BeginChild(
        "main_menu",
        ImVec2(60, ImGui::GetContentRegionAvail().y),
        ImGuiChildFlags_None,
        ImGuiWindowFlags_None
    );
    
    ImGui::PushStyleColor(ImGuiCol_Button, ImGui::GetStyleColorVec4(ImGuiCol_ChildBg));
    ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 5.f);

    if(ImGui::ImageButton(
        "home_button",
        gui::assets::assets_ref::get_instance()->get_image("home"),
        ImVec2(16, 16)))
    {
    }
    
    ImGui::Spacing();
    
    if(ImGui::ImageButton("chat_button",
        gui::assets::assets_ref::get_instance()->get_image("chat"),
        ImVec2(16, 16)))
    {
    }
    
    ImGui::Spacing();
    
    if(ImGui::ImageButton("phone_button",
        gui::assets::assets_ref::get_instance()->get_image("phone"),
        ImVec2(16, 16)))
    {
    }
    
    ImGui::Spacing();
    
    if(ImGui::ImageButton("calendar_button",
        gui::assets::assets_ref::get_instance()->get_image("calendar"),
        ImVec2(16, 16)))
    {
    }
    
    ImGui::Spacing();
    
    if(ImGui::ImageButton("monitor_button",
        gui::assets::assets_ref::get_instance()->get_image("monitor"),
        ImVec2(16, 16)))
    {
    }

    ImGui::Dummy(ImVec2(0, 100));
    
    if(ImGui::ImageButton("settings_button",
        gui::assets::assets_ref::get_instance()->get_image("settings"),
        ImVec2(16, 16)))
    {
    }

    ImGui::PopStyleVar(1);
    ImGui::PopStyleColor(1);
    
    ImGui::EndChild();
}

} // gui
