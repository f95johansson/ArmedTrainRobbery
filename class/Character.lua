local class = require 'lib.middleclass'

local Character = class('Character')

function Character:initialize(dialog)
    self.background = 'temp_background'
    self.text = dialog
end


return Character