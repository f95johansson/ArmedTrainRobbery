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
    game = require 'gamestate.dialog',
}

function love.load()
    assert(love.graphics.isSupported('canvas'), 'Your graphics card does not support canvases, sorry!')

    media = require 'media'
    --specs = require 'specs'


    Gamestate.registerEvents()
    Gamestate.switch(gamestate.intro)
end


-- Global gamestates functions:
function love.focus(f) end

function love.update( dt )
    Timer.update(dt)
end

function love.draw()
    --love.graphics.setFont(media.font.b14)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
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
