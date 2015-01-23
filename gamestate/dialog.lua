------------------------------------------------------------
-- Game Gamestate ------------------------------------------
------------------------------------------------------------
-- Manages the dialog in the playable part, 'the dialog'.
------------------------------------------------------------

-- Libraries
local class = require 'lib.middleclass'
local Gamestate = require 'lib.hump.gamestate'
local Timer = require 'lib.hump.timer'
local Character = require 'class.Character'

-- Gamestate
local dialog = {}

function dialog:init()
    self.character = Character:new()
    self.dialog_number = 1
end

function dialog:update(dt)
end

function dialog:draw()
    love.graphics.draw(media.image[self.character.background], 0, 0)

    self:drawDialog()
end

function dialog:drawDialog()
    love.graphics.setColor(100, 100, 100)
    local size = 100
    love.graphics.rectangle('fill', 0, love.graphics.getHeight()-100, love.graphics.getWidth(), 100)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print(self.character.text[self.dialog_number], 0, love.graphics.getHeight()-100)
end

function dialog:keypressed(key, isrepeat)
    if contains
end

return dialog