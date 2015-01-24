local class = require 'lib.middleclass'

local Character = class('Character')

function Character:initialize(dialog, image, nose_image, nose_pos)
    self.background = 'temp_background'
    self.image = image
    self.image_nose = nose_image
    self.nose_pos = nose_pos
    self.text = dialog
end


return Character