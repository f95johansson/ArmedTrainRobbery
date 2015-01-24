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
    self.offset_x = 0
    self.offset_y = 0
    self.dialog_size = 100

    self:setTimer()
end

function dialog:setTimer()
    self.timer = Timer.tween(.1, self, {offset_x = love.math.random(-2, 2), offset_y = love.math.random(-18, 18)}, 'in-out-quad',
                function()
                    self:setTimer()
                end)
end

function dialog:leave()
    Timer.clear()
end


function dialog:update(dt)
end

function dialog:draw()
    love.graphics.draw(media.image[self.character.background], 0, 0)

    local cx = love.graphics.getWidth()-self.character.image:getWidth()
    local cy = love.graphics.getHeight()-self.character.image:getHeight() - self.dialog_size + 10
    love.graphics.draw(self.character.image, cx + self.offset_x, cy + self.offset_y)
    love.graphics.draw(self.character.image_nose, cx + self.character.nose_pos[1] - self.character.image_nose:getWidth()/2 + self.offset_x,
                cy + self.character.nose_pos[2] - self.character.image_nose:getHeight()/2 + self.offset_y)
    self:drawDialog()
end

function dialog:drawDialog()
    love.graphics.setColor(100, 100, 100)
    local size = self.dialog_size
    love.graphics.rectangle('fill', 0, love.graphics.getHeight()-size, love.graphics.getWidth(), size)
    
    love.graphics.setColor(255, 255, 255)
    local question = self.character.text[self.dialog_number][1]
    love.graphics.print(question, 20, size)

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