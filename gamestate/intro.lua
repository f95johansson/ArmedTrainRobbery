------------------------------------------------------------
-- Intro Gamestate ------------------------------------------
------------------------------------------------------------
-- 
------------------------------------------------------------

-- Libraries
local class = require 'lib.middleclass'
local Gamestate = require 'lib.hump.gamestate'
local Timer = require 'lib.hump.timer'
local Layer = require 'class.Layer'

-- Gamestate
local intro = {}

function intro:init()
    media['sound'].intro_theme:play()
    self.paralax = {Layer:new(0, 0, media.image.iparalax4, 340), Layer:new(0, 0, media.image.iparalax3, 360),
                    Layer:new(0, 0, media.image.iparalax2, 380), Layer:new(0, 0, media.image.iparalax1, 400),Layer:new(0, 0, media.image.iparalax0, 400)}
end

function intro:update(dt)
    for _, paralax in ipairs(self.paralax) do
        paralax:update(dt)
    end
end

function intro:draw()
    for _, paralax in ipairs(self.paralax) do
        paralax:draw()
    end

    love.graphics.draw(media.image.introTrain, 0, 0)

    love.graphics.setFont(media.font.f48)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print('Armed Train Robbery', love.graphics.getWidth()/2 - media.font.f48:getWidth('Armed Train Robbery')/2, 200)
end

function intro:keypressed(key, isrepeat)
    media['sound'].intro_theme:stop()
    Gamestate.switch(gamestate.train)
end

return intro
