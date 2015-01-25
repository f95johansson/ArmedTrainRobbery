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
local Layer = require 'class.Layer'
local Timer = require 'lib.hump.timer'

local actions = require 'actions'

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
    local ticket_character = Character:new(dialogs.ticket_man, media.image.ticket_man_dialog, media.image.ticket_man_nose, media.image['ticket_man' .. '_left_arm'], media.image['ticket_man' .. '_right_arm'], specs.nose_pos.ticket_man, media.sound['ticket_man_theme'])
    local x, y = unpack(specs.ticker_man_paths[1][1])
    self.ticket_man = TicketMan:new(x, y, media.image.ticket_man, ticket_character, specs.ticker_man_paths[1])
    self.entities = {} 
    media.sound.walk:setVolume(0.6)

    for name, dialog in pairs(dialogs) do
        if name ~= 'ticket_man' and name ~= 'ticket_man2' then
            local action = actions[name]
            local character
            if media.sound[name .. '_theme'] then
                character = Character:new(dialog, media.image[name .. '_dialog'], media.image[name .. '_nose'], media.image[name .. '_left_arm'], media.image[name .. '_right_arm'], specs.nose_pos[name], agent, media.sound[name .. '_theme'])
                character.song:setLooping(true)
            else
                character = Character:new(dialog, media.image[name .. '_dialog'], media.image[name .. '_nose'], media.image[name .. '_left_arm'], media.image[name .. '_right_arm'], specs.nose_pos[name], agent)
            end
            local x, y = unpack(specs.position[name])
            self.entities[name] = Entity:new(x, y, media.image[name], character, specs.level[name])
        end
    end


    self.focus = nil -- the character you want to talk to
    time = 2 * 60

    self.rail1 = Layer:new(0, 0, media.image.grass_bg, 300)

    self.ticket_man:startWalking(2)
end

function train:enter()
    self.focus = nil
end

function train:update(dt)
    self:movePlayer(dt)
    self.rail1:update(dt)

    -- Check for collision line against player
    if self.ticket_man and self.ticket_man.moving and self.ticket_man.seen == false then
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

    if self.ticket_man and self.ticket_man.moving == false then
        self.ticket_man = nil
        Timer.add(time, function() 
                local x, y = unpack(specs.ticker_man_paths[2][1])
                local ticket_character = Character:new(dialogs.ticket_man2, media.image.ticket_man_dialog, media.image.ticket_man_nose, media.image['ticket_man' .. '_left_arm'], media.image['ticket_man' .. '_right_arm'], specs.nose_pos.ticket_man)
                self.ticket_man = TicketMan:new(x, y, media.image.ticket_man, ticket_character, specs.ticker_man_paths[2]) 
                self.ticket_man:startWalking(w)
            end)

    end
end

function train:draw()
    self.rail1:draw()

    love.graphics.push()
    love.graphics.translate(love.graphics.getWidth()/2-media.image['level' .. self.level]:getWidth()/2, 
                            love.graphics.getHeight()/2-media.image['level' .. self.level]:getHeight()/2)
    love.graphics.draw(media.image['level' .. self.level], 0, 0)
    for _, entity in pairs(self.entities) do
        if entity.level == self.level then
            entity:draw()
        end 
    end
    self.player:draw()
    if self.ticket_man then
        self.ticket_man:draw()
    end
    love.graphics.pop()
    -- See the trains on the side
    if self.level ~= 1 then
        love.graphics.draw (media.image['level' .. (self.level-1)],-600,
                            love.graphics.getHeight()/2-media.image['level' .. (self.level-1)]:getHeight()/2)
    end 
    if self.level ~= 3 then
        love.graphics.draw (media.image['level' .. (self.level+1)], love.graphics.getWidth()-100, 
                            love.graphics.getHeight()/2-media.image['level' .. (self.level+1)]:getHeight()/2)
    end 
end

function train:keypressed(key, isrepeat)
    if key == 'return' then
        for _, entity in pairs(self.entities) do
            if math.distObjects(self.player, entity) < self.player.width/2 + entity.width/2 and entity.level == self.level then
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
    if self.ticket_man and self.ticket_man.moving then
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
        local c = self:check_collision(new_x + (self.player.width/2-3)*math.cos(angle), new_y + (self.player.height/2-3)*math.sin(angle), true)
        table.insert(collision, c)
        if c == true then
            break
        end
    end

    if not table.contains(collision, true) then
        self.player.x = new_x
        self.player.y = new_y
    end

end

function train:check_collision(x, y, player)
    local collision_map = media.image['mask' .. self.level]

    if x < 0 and player then --or x > collision_map:getWidth() or y < 0 or y > collision_map:getHeight()
        self.level= self.level-1
        local map = media.image['level' .. self.level]
        self.player.x = map:getWidth() - 50
        return true
    elseif x > collision_map:getWidth() and player then
        self.level = self.level+1
        print(self.level)
        self.player.x = 50
        return true
    elseif x < 0 or x > collision_map:getWidth() then
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
