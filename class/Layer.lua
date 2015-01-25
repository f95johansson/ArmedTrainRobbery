local class = require 'lib.middleclass'

local Layer = class('Layer')

function Layer:initialize(x, y, image, speed )
    self.x = x
    self.y = y
    self.image = image
    self.speed = speed
    self.width = self.image:getWidth()
end

function Layer:update(dt)
    self.x = (self.x - self.speed*dt) % self.width
end

function Layer:draw()
    love.graphics.draw(self.image, self.x, self.y)
    love.graphics.draw(self.image, self.x - self.width, self.y)
end


return Layer