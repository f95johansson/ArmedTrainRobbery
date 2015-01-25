------------------------------------------------------------
-- Intro Gamestate ------------------------------------------
------------------------------------------------------------
-- 
------------------------------------------------------------

-- Libraries
local class = require 'lib.middleclass'
local Gamestate = require 'lib.hump.gamestate'
local Timer = require 'lib.hump.timer'

-- Gamestate
local intro = {}

function intro:init()
    media['sound'].intro_theme:play()
end

function intro:update(dt)
end

function intro:draw()
    love.graphics.print('intro', 50, 50)
end

function intro:keypressed(key, isrepeat)
    media['sound'].intro_theme:stop()
    Gamestate.switch(gamestate.train)
end

return intro
