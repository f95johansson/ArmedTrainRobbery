------------------------------------------------------------
-- Game Gamestate ------------------------------------------
------------------------------------------------------------
-- Manages the dialog in the playable part, 'the dialog'.
------------------------------------------------------------

-- Libraries
local class = require 'lib.middleclass'
local Gamestate = require 'lib.hump.gamestate'
local Timer = require 'lib.hump.timer'

-- Gamestate
local dialog = {}

function dialog:init()
    self.background = nil
    self.person_image = nil
end

function dialog:update(dt)
end

function dialog:draw()
    love.graphics.print('dialog', 50, 50)
end

function dialog:keypressed(key, isrepeat)
end

return dialog