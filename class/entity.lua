local class = require 'lib.mihump.timerddleclass'
local Entity = class ('Entity')

-- class body
    
    function Entity:initialize(x,y,img)
        self.x = x
        self.y = y
        self.image = img
        self.height = self.image:getHeight()
        self.width = self.image:getWidth()
        
    end

    function Entity:draw()
        love.graphics.draw(self.image, self.x, self.y)
    end
-- end class
return Entity
