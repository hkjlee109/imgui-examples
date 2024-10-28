#pragma once

namespace gui {

class gui_main_window
{
public:
    gui_main_window(bool* open);
    
    void draw();
    
private:
    bool* _open;
};

} // gui
