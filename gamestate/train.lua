------------------------------------------------------------
-- Game Gamestate ------------------------------------------
------------------------------------------------------------
-- Manages the train in the playable part, 'the train'.
------------------------------------------------------------

-- Libraries
local class = require 'lib.middleclass'
local Gamestate = require 'lib.hump.gamestate'
local Timer = require 'lib.hump.timer'

-- Gamestate
local train = {}

function train:init()
    train_timer = Timer.new()
end

function train:update(dt)
end

function train:draw()
    love.graphics.print('train', 50, 50)
end

function train:keypressed(key, isrepeat)
    Gamestate.switch(gamestate.intro)
end

return train