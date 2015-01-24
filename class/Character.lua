local class = require 'lib.middleclass'

local Character = class('Character')

function Character:initialize()
    self.background = 'temp_background'
    self.text = {
        {'Hi, What do you want?', 
            {'answer 1#1', 'answer 2#2'}
        },
        {'2', {'1#1'}},
        {'3', {'2#1'}},
        {'4', {'3#1'}},
        }
end


return Character