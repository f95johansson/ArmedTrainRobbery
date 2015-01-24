local class = require 'lib.middleclass'

local Entity = class ('Entity')

-- class body
    
function Entity:initialize(x,y,img, character)
    self.x = x
    self.y = y
    self.image = img
    self.height = self.image:getHeight()
    self.width = self.image:getWidth()
    self.character = character
end
function Entity:draw()
    love.graphics.draw(self.image, self.x-self.width/2, self.y-self.height/2)
end

function Entity:getCenter()
    return self.x, self.y
end
-- end class
return Entity
