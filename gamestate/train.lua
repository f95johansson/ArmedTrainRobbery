------------------------------------------------------------
-- Game Gamestate ------------------------------------------
------------------------------------------------------------
-- Manages the train in the playable part, 'the train'.
------------------------------------------------------------

-- Libraries
local class = require 'lib.middleclass'
local Gamestate = require 'lib.hump.gamestate'
local Character = require 'class.Character'
local Entity = require 'class.Entity'
local TicketMan = require 'class.TicketMan'
local Timer = require 'lib.hump.timer'

-- Gamestate
local train = {}
local speed = 150

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
end

local function moveNpc(x,y,npc)
    
end

function train:init()
    self.level = 2
    self.player = Entity:new (100,100, media.image.player)
    local ticket_character = Character:new(dialogs.ticket_man, media.image.ticket_man_dialog, media.image.ticket_man_nose, media.image['ticket_man' .. '_left_arm'], media.image['ticket_man' .. '_right_arm'], specs.nose_pos.ticket_man)
    self.ticket_man = TicketMan:new(100, 239, media.image.ticket_man, ticket_character)
    self.entities = {} 
    media.sound.walk:setVolume(0.6)

    for name, dialog in pairs(dialogs) do
        if name ~= 'ticket_man' then
            local character = Character:new(dialog, media.image[name .. '_dialog'], media.image[name .. '_nose'], media.image[name .. '_left_arm'], media.image[name .. '_right_arm'], specs.nose_pos[name])
            local x, y = unpack(specs.position[name])
            self.entities[name] = Entity:new(x, y, media.image[name], character)
        end
    end


    self.focus = nil -- the character you want to talk to
    time = 2 * 60

    self.ticket_man:startWalking(1)
end

function train:enter()
    self.focus = nil
end

function train:update(dt)
    self:movePlayer(dt)

    -- Check for collision line against player
    if self.ticket_man.moving and self.ticket_man.seen == false then
        local angle = math.angle(self.ticket_man.x, self.ticket_man.y, self.player.x, self.player.y)
        local collision = {}
        for i = 1, 40 do
            local x = (self.ticket_man.x - self.player.x)*math.cos(angle)
            local y = (self.ticket_man.y - self.player.y)*math.sin(angle)
            table.insert(collision, train:check_collision( self.ticket_man.x+x, self.ticket_man.y+y))
        end
        if not table.contains(collision, true) then
            self.focus = self.ticket_man
            self.ticket_man.seen = true
            Gamestate.switch(gamestate.dialog)
        end
    end

end

function train:draw()

    love.graphics.push()
    love.graphics.translate(love.graphics.getWidth()/2-media.image['level' .. self.level]:getWidth()/2, 
                            love.graphics.getHeight()/2-media.image['level' .. self.level]:getHeight()/2)
    love.graphics.draw(media.image['level' .. self.level], 0, 0)
    for _, entity in pairs(self.entities) do
        entity:draw()
    end
    self.player:draw()
    self.ticket_man:draw()
    love.graphics.pop()
end

function train:keypressed(key, isrepeat)
    if key == 'return' then
        for _, entity in pairs(self.entities) do
            if math.distObjects(self.player, entity) < self.player.width/2 + entity.width/2 then
                self.focus = entity
                Gamestate.switch(gamestate.dialog)
            end
        end
    end
end

function train:walkSound()
    media.sound.walk:play()
end

function train:movePlayer(dt)
    if self.ticket_man.moving then
        return
    end
    local new_x = self.player.x
    local new_y = self.player.y
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        new_x = self.player.x - speed*dt
    elseif love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        new_x = self.player.x + speed*dt
    end
    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        new_y = self.player.y - speed*dt
    elseif love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        new_y = self.player.y + speed*dt
    end
    if (self.player.x ~= new_x or self.player.y ~= new_y) and not media.sound.walk:isPlaying() then
        Timer.addPeriodic (0.3, function() media.sound.walk:play() end,1 )
    end

    local collision = {}
    for i = 1, 16 do
        local angle = 2*math.pi/16 * (i-1)
        table.insert(collision, self:check_collision(new_x + (self.player.width/2-3)*math.cos(angle), new_y + (self.player.height/2-3)*math.sin(angle)))
    end

    if not table.contains(collision, true) then
        self.player.x = new_x
        self.player.y = new_y
    end

end

function train:check_collision(x, y)
    local collision_map = media.image['mask' .. self.level]

    if x < 0  then --or x > collision_map:getWidth() or y < 0 or y > collision_map:getHeight()
        -- Cafeteria
        self.level=self.level-1
        local map = media.image['level' .. self.level]
        self.player.x = map:getWidth() - 50
        return true
    elseif x > collision_map:getWidth() then
        self.level = self.level+1
        self.player.x = 50
        return true
    end

    local r, g, b, a = collision_map:getData():getPixel(x, y)

    if r == 0 and g == 0 and b == 0 then
        return true
    else
        return false
    end
end

return train
