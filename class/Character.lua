local class = require 'lib.middleclass'

local Character = class('Character')

function Character:initialize()
    self.background = 'temp_background'
    self.text = {[1] = 'Hi, What do you want?'}
end


return Character