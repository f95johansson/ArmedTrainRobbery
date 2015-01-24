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
    self.dialog_number = 1
    self.selected = 1
end

function dialog:enter(previous_state)
    self.previous_state = previous_state
    self.character = previous_state.focus.character
    self.dialog_number = 1
    self.selected = 1
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
    local question = self.character.text[self.dialog_number][1]
    love.graphics.print(question, 0, 100)

    for i = 1, #self.character.text[self.dialog_number][2] do
        local answer = self.character.text[self.dialog_number][2][i]:sub(1, self.character.text[self.dialog_number][2][i]:find('#')-1)
        if self.selected == i then
            love.graphics.setColor(255, 255, 255)
        else
            love.graphics.setColor(200, 200, 200)
        end
        love.graphics.print(answer, 0, love.graphics.getHeight()-100 + 35*(i-1))
    end

end

function dialog:keypressed(key, isrepeat)
    if key == 'down' then
        if self.character.text[self.dialog_number][2][self.selected+1] ~= nil then
            self.selected = self.selected + 1
        end
    elseif key == 'up' then
        if self.character.text[self.dialog_number][2][self.selected-1] ~= nil then
            self.selected = self.selected - 1
        end
    elseif key == 'return' then 
        -- Get hashtag number
        self.dialog_number = tonumber(
            self.character.text[self.dialog_number][2][self.selected]:sub(
                self.character.text[self.dialog_number][2][self.selected]:find('#')+1, 
                #self.character.text[self.dialog_number][2][self.selected]))
        -- Reset selected
        self.selected = 1

        if self.dialog_number == 0 then
            Gamestate.switch(self.previous_state)
        end
    end
end

return dialog