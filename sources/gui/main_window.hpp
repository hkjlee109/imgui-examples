#pragma once

namespace gui {

class main_window
{
public:
    main_window(bool* open);
    
    void draw();
    
private:
    bool* _open;
};

} // gui
