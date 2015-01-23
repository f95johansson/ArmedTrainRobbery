------------------------------------------------------------
-- Config File ---------------------------------------------
------------------------------------------------------------
-- Global configurations
------------------------------------------------------------

function love.conf(t)

    t.title = 'Untitled'
    t.version = '0.9.1'
    t.identity = 'Untitled' 

    t.window.width = 1000
    t.window.height = 700
    t.window.minwidth = 1000
    t.window.minheight = 700
    t.window.fullscreen = false
    t.window.fullscreentype = 'desktop'
    t.window.highdpi = true
    t.window.resizable = true
    t.window.vsync = true

    -- Turn off some unused modules to optimize
    t.modules.joystick = false
    t.modules.thread = false
end
