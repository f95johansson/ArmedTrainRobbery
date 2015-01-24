local class = require 'lib.middleclass'
local Timer = require 'lib.hump.timer'

local TicketMan = class ('TicketMan')
    
function TicketMan:initialize(x,y,img, character)
    self.x = x
    self.y = y
    self.image = img
    self.height = self.image:getHeight()
    self.width = self.image:getWidth()
    self.character = character
    self.moving = false
    self.looking = false
    self.seen = false

    self.path = {
        --{0, 239},
        {96, 239},
        {113, 91},
        {96, 239},
        {299, 239},
        {297, 90},
        {299, 239},
        {654, 242},
    }
end

function TicketMan:draw()
    love.graphics.draw(self.image, self.x-self.width/2, self.y-self.height/2)
end

function TicketMan:startWalking( path_number, step )
    self.moving = true
    step = step or 1
    self.timer = Timer.tween(1, self, {x = self.path[step][1], y = self.path[step][2]}, 'linear',
            function() 
                if self.path[step+1] then
                    self:startWalking(path_number, step + 1)
                else
                    self.moving = false
                end
            end)
end

function TicketMan:getCenter()
    return self.x, self.y
end

return TicketMan
