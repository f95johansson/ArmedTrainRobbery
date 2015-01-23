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
    self.background = 'temp_background'
    self.person_image = nil
end

function dialog:update(dt)
end

function dialog:draw()
    love.graphics.draw(media.image[self.background], 0, 0)

    self:drawDialog()
end

function dialog:drawDialog()
    love.graphics.setColor(100, 100, 100)
    local size = 100
    love.graphics.rectangle('fill', 0, love.graphics.getHeight()-100, love.graphics.getWidth(), 100)
end

function dialog:keypressed(key, isrepeat)
end

return dialog