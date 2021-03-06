local class = require 'lib.middleclass'

local Character = class('Character')

function Character:initialize(dialog, image, nose_image, arm_l, arm_r, nose_pos, agent, song,background,voice, action)
    
    self.image = image
    self.image_nose = nose_image
    self.arm_l = arm_l
    self.arm_r = arm_r
    self.nose_pos = nose_pos
    self.text = dialog
    self.song = song or nil
    self.voice = voice or nil
    self.background = background or media.image.background
    self.action = action or function() end
end

return Character
