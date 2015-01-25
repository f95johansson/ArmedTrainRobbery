------------------------------------------------------------
-- Main File -----------------------------------------------
------------------------------------------------------------
-- Sets up gamestates which manage the game in
-- different states. This file also manages
-- everything that is universal for the game,
-- example: 'f' key is change to/from fullscreen.
------------------------------------------------------------

-- Libraries:
local Gamestate = require 'lib.hump.gamestate'
local Timer = require 'lib.hump.timer'
require 'lib.useful'


-- Gamestates:
gamestate = {
    intro = require 'gamestate.intro',
    dialog = require 'gamestate.dialog',
    train = require 'gamestate.train',
}

function love.load()
    assert(love.graphics.isSupported('canvas'), 'Your graphics card does not support canvases, sorry!')

    -- Globals: 
    
    media = require 'media'
    specs = require 'specs'
    dialogs = require 'dialogs'

    time = 0

    hidden = false
    matches = false
    coffee = false
    media.sound['main_theme']:setLooping(true)
    media.sound['intro_theme']:setLooping(true)



    Gamestate.registerEvents()
    Gamestate.switch(gamestate.intro)
end


-- Global gamestates functions:
function love.focus(f) end

function love.update( dt )
    Timer.update(dt)
    time = time - dt
end

function love.draw()
    --love.graphics.setFont(media.font.b14)
    love.graphics.setColor(255, 255, 255, 255)
    --love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)

    love.graphics.setFont(media.font.f18)
    if time < 0 then
        love.graphics.print('Time: 0:00', 10, 10)
    else
        love.graphics.print('Time: ' .. tostring(math.floor(time/60)) .. ':' .. tostring(time % 60):sub(1, 2), 10, 10)
    end
end

function love.keypressed( key, isrepeat )
    --if key == 'escape' then love.event.quit()
    if key == 'm' then
        if love.audio.getVolume() ~= 0 then
            love.audio.setVolume(0)
        else
            love.audio.setVolume(1)
        end

    elseif key == 'f' then love.window.setFullscreen( not love.window.getFullscreen( ) )
    elseif key == 'k' and love.keyboard.isDown('rgui') then
        debug.debug()
    end


end

function love.resize( width, height )
end
