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
    self.player = Entity:new (100,100, media.image.player)
    self.entities = {}

    for name, dialog in pairs(dialogs) do
        local character = Character:new(dialog, media.image[name .. '_dialog'], media.image[name .. '_nose'], specs.nose_pos[name])
        self.entities[name] = Entity:new(100, 100, media.image[name], character)
    end

    self.focus = nil -- the character you want to talk to
end

function train:enter()
    self.focus = nil
end

function train:update(dt)
    self:movePlayer(dt)
end

function train:draw()
    love.graphics.draw(media.image.collision_map, 0, 0)
    love.graphics.print('train', 50, 50)
    for _, entity in pairs(self.entities) do
        entity:draw()
    end
    self.player:draw()
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

function train:movePlayer(dt)
    local new_x = self.player.x
    local new_y = self.player.y
    if love.keyboard.isDown('a') then
        new_x = self.player.x - speed*dt
    elseif love.keyboard.isDown('d') then
        new_x = self.player.x + speed*dt
    end
    if love.keyboard.isDown('w') then
        new_y = self.player.y - speed*dt
    elseif love.keyboard.isDown('s') then
        new_y = self.player.y + speed*dt
    end


    local collision = {}
    for i = 1, 16 do
        local angle = 2*math.pi/16 * (i-1)
        table.insert(collision, check_collision(new_x + self.player.width/2*math.cos(angle), new_y + self.player.height/2*math.sin(angle)))
    end
    if not table.contains(collision, true) then
        self.player.x = new_x
        self.player.y = new_y
    end
end

function check_collision(x, y)
    local collision_map = media.image.collision_map
    if x < 0 or x > collision_map:getWidth() or y < 0 or y > collision_map:getHeight() then
        return true
    end
    local r, g, b, a = collision_map:getData():getPixel(x, y)

    if r == 0 and g == 0 and b == 0 then
        print('collide')
        return true
    else
        return false
    end
end

return train
