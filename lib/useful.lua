-- Make so that string[1] works
--getmetatable('').__index = function(str,i) return string:sub(i,i) end

-- Returns the distance between two points.
function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end

function math.distObjects(object1, object2)
    local x1, y1 = object1:getCenter() 
    local x2, y2 = object2:getCenter()
    return ((x2-x1)^2+(y2-y1)^2)^0.5
end

-- Clamps a number to within a certain range.
function math.clamp(low, n, high) return math.min(math.max(low, n), high) end

function math.round(x) return x + 0.5 - (x + 0.5) % 1 end

-- Returns the angle between two points.
function math.angle(x1,y1, x2,y2) 
    return math.atan2(y2-y1, x2-x1)
end

function math.angleObjects(object1, object2)
    local x1, y1 = object1:getCenter() 
    local x2, y2 = object2:getCenter()
    return math.atan2(y2-y1, x2-x1)
end

-- Returns 1 if number is positive, -1 if it's negative, or 0 if it's 0.
function math.sign(n) return n>0 and 1 or n<0 and -1 or 0 end

-- Randomly returns either -1 or 1.
function math.rsign() return math.random(2) == 2 and 1 or -1 end

-- Make first letter capital
function string.capitalize(str)
    return str:gsub("%a", string.upper, 1)
end


-- Check if variable is inside table
function table.contains( table, var )
    for k, v in ipairs(table) do
        if var == v then
            return k
        end
    end
    return false
end

-- Check if key is inside table
function insideKey( key, table )
    for k, v in pairs(table) do
        if key == k then
            return v
        end
    end
    return false
end


function printTable(t)
    if t[1] ~= nil then
        for k, v in ipairs(t) do
            print('Key: '..tostring(k)..'\t\tValues: '..tostring(v))
        end
    else
        for k, v in pairs(t) do
            print('Key: '..tostring(k)..'\t\tValues: '..tostring(v))
        end
    end
    print()
end

-- Shallow copy
function table.copy(t)
  local u = { }
  for k, v in pairs(t) do u[k] = v end
  return setmetatable(u, getmetatable(t))
end

-- copy table and all its content -- don't work that good
function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function table.merge(t1, t2)
    for k, v in pairs(t2) do
        if (type(v) == "table") and (type(t1[k] or false) == "table") then
            merge(t1[k], t2[k])
        else
            t1[k] = v
        end
    end
    return t1
end

-- Requeries first and second to be objects with x, y, width and height attributes
function check_collision(first, second)
    if second.x - second.width/2 < first.x < second.x + second.width/2 and second.y - second.height/2 < first.y < second.y +second.height/2 then
        return True
    end
end

function within( x, y, x0, y0, width, height )
    if x0 < x and x < x0 + width and y0 < y and y < y0 + height then
        return true
    else 
        return false
    end
end

function string.classNameToVariableName(str)
    -- For example TheFrameDropper -> the_frame_dropper
    local new_string = string.lower(str:sub(1, 1))
    for i = 2, string.len(str) do
        local char = str:sub(i, i)
        if char == string.upper(char) then
            new_string = new_string .. '_' .. string.lower(char)
        else
            new_string = new_string .. char
        end
    end
    return new_string
end

-- Converts HSV to RGB. (input and output range: 0 - 255)
function HSV(h, s, v)
    if s <= 0 then return v,v,v end
    h, s, v = h/256*6, s/255, v/255
    local c = v*s
    local x = (1-math.abs((h%2)-1))*c
    local m,r,g,b = (v-c), 0,0,0
    if h < 1     then r,g,b = c,x,0
    elseif h < 2 then r,g,b = x,c,0
    elseif h < 3 then r,g,b = 0,c,x
    elseif h < 4 then r,g,b = 0,x,c
    elseif h < 5 then r,g,b = x,0,c
    else              r,g,b = c,0,x
    end return (r+m)*255,(g+m)*255,(b+m)*255
end

function hsvToRgb(h, s, v)
    local was_table
    if type(h) == 'table' then
        was_table = true
        s = h[2]
        v = h[3]
        h = h[1]
    end
    h, s, v = h / 255, s / 255, v / 255
    local r, g, b
    local i = math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);
    i = i % 6
    if i == 0 then r, g, b = v, t, p
    elseif i == 1 then r, g, b = q, v, p
    elseif i == 2 then r, g, b = p, v, t
    elseif i == 3 then r, g, b = p, q, v
    elseif i == 4 then r, g, b = t, p, v
    elseif i == 5 then r, g, b = v, p, q
    end
    if was_table then
        return {r * 255, g * 255, b * 255}
    else
        return r * 255, g * 255, b * 255
    end
end

function rgbToHsv(r, g, b)
    local was_table
    if type(r) == 'table' then
        was_table = true
        g = r[2]
        b = r[3]
        r = r[1]
    end
    r, g, b = r / 255, g / 255, b / 255
    local max, min = math.max(r, g, b), math.min(r, g, b)
    local h, s, v
    v = max
    local d = max - min
    if max == 0 then s = 0 else s = d / max end
    if max == min then
        h = 0 -- achromatic
    else
        if max == r then
        h = (g - b) / d
        if g < b then h = h + 6 end
        elseif max == g then h = (b - r) / d + 2
        elseif max == b then h = (r - g) / d + 4
        end
        h = h / 6
    end
    if was_table then
        return {h, s, v}
    else
        return h, s, v
    end
end

--- Love2d only ---
function rounded_rectangle(mode, x, y, w, h, r, n)
    n = n or 20 -- Number of points in the polygon.
    if n % 4 > 0 then n = n + 4 - (n % 4) end -- Include multiples of 90 degrees.
    local pts, c, d, i = {}, {x + w / 2, y + h / 2}, {w / 2 - r, r - h / 2}, 0
    while i < n do
        local a = i * 2 * math.pi / n
        local p = {r * math.cos(a), r * math.sin(a)}
        for j = 1, 2 do
            table.insert(pts, c[j] + d[j] + p[j])
            if p[j] * d[j] <= 0 and (p[1] * d[2] < p[2] * d[1]) then
                d[j] = d[j] * -1
                i = i - 1
            end
        end
        i = i + 1
    end
    love.graphics.polygon(mode, pts)
end 

function grid(x, y, width, height, rows, columns)
    for i=1,rows-1 do
        love.graphics.line(x + width/rows*i, y, x + width/rows*i, y + height)
    end
    for i=1,columns-1 do
        love.graphics.line(x, y + height/columns*i, x + width, y + height/columns*i)
    end
end

-- filter out the objects that should be colliding (bump.lua)
function collide_filter(object)
    return object.collide == true
end
