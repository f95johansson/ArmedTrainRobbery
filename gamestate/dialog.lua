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
    self.pop_raius = love.graphics.getWidth()/2
    self.pop_timer = Timer.tween(.8, self, {pop_raius = 0}, 'linear')
end

function dialog:setTimer()
    self.timer = Timer.tween(.1, self, {offset_x = love.math.random(-2, 2), offset_y = love.math.random(-10, 10)}, 'in-out-quad',
                function()
                    self:setTimer()
                end)
end

function dialog:leave()
    Timer.cancel(self.timer)
end


function dialog:update(dt)
end

function dialog:draw()
    love.graphics.setFont(media.font.f18)

    love.graphics.draw(media.image[self.character.background], 0, 0)

    local cx = love.graphics.getWidth()-self.character.image:getWidth()
    local cy = love.graphics.getHeight()-self.character.image:getHeight() - self.dialog_size + 10
    love.graphics.draw(self.character.image, cx + self.offset_x, cy + self.offset_y)
    love.graphics.draw(self.character.image_nose, cx + self.character.nose_pos[1] - self.character.image_nose:getWidth()/2 + self.offset_x,
                cy + self.character.nose_pos[2] - self.character.image_nose:getHeight()/2 + self.offset_y)
    
    self:drawArmes(cx, cy)
    self:drawDialog()


    -- Transition effekt
    if self.pop_raius > 0 then
        local func = function() love.graphics.circle('fill', love.graphics.getWidth()/2, love.graphics.getHeight()/2, self.pop_raius, self.pop_raius/3) end
        love.graphics.setStencil(func)
        self.previous_state:draw()
        love.graphics.setStencil()
    end
end

function dialog:drawDialog()
    love.graphics.setColor(100, 100, 100)
    local size = self.dialog_size
    love.graphics.rectangle('fill', 0, love.graphics.getHeight()-size, love.graphics.getWidth(), size)
    
    love.graphics.setColor(255, 255, 255)
    -- Question
    local question = self.character.text[self.dialog_number][1]
    local text_width = media.font.f24:getWidth(question)
    local scale = text_width/(media.image.question_bg:getWidth())
    love.graphics.setFont(media.font.f24)
    --Gradient background: love.graphics.draw(media.image.question_bg, text_width - media.image.question_bg:getWidth()/2, size +  13- media.image.question_bg:getHeight()/2 * scale, 0, scale)
    love.graphics.setColor(0, 0, 0, 200)
    local number_of_n = 0
    local index = 1
    repeat
        number_of_n = number_of_n + 1
        index = question:find('\n', index+1)
    until index == nil
    love.graphics.rectangle('fill', 25, size-5, text_width+10, media.font.f24:getHeight()*number_of_n + 20, 10)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print(question, 30, size)

    love.graphics.setFont(media.font.f18)
    -- Answers
    for i = 1, #self.character.text[self.dialog_number][2] do
        local answer = self.character.text[self.dialog_number][2][i]:sub(1, self.character.text[self.dialog_number][2][i]:find('#')-1)
        if self.selected == i then
            love.graphics.setColor(255, 255, 255)
        else
            love.graphics.setColor(200, 200, 200)
        end
        love.graphics.print(answer, 15, love.graphics.getHeight()-self.dialog_size+5 + 30*(i-1))
    end

end

function dialog:drawArmes(cx, cy)
    love.graphics.draw(self.character.arm_l, cx, love.graphics.getHeight()-self.character.arm_l:getHeight())
    love.graphics.draw(self.character.arm_r, cx, love.graphics.getHeight()-self.character.arm_l:getHeight())
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