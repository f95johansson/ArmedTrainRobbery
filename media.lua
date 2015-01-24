return {

image = {
    temp_background = love.graphics.newImage('/resources/temp_bg.png'),
    player = love.graphics.newImage('/resources/player.png'),
    ticket_man = love.graphics.newImage('/resources/ticket_man.png'),
    ticket_man_dialog = love.graphics.newImage('/resources/ticket_man_dialog.png'),
    ticket_man_nose = love.graphics.newImage('/resources/ticket_man_nose.png'),
    ticket_man_left_arm = love.graphics.newImage('/resources/kondhandL.png'),
    ticket_man_right_arm = love.graphics.newImage('/resources/kondhandR.png'),
    level2 = love.graphics.newImage('/resources/level2.png'),
    mask2 = love.graphics.newImage('/resources/mask2.png'),
    question_bg = love.graphics.newImage('/resources/question_bg.png'),
    agent_left_arm = love.graphics.newImage('/resources/agentarmL.png'),
    agent_right_arm = love.graphics.newImage('/resources/agentarmR.png'),
    agent = love.graphics.newImage('/resources/agent.png'),
    agent_dialog = love.graphics.newImage('/resources/agentbod.png'),
    agent_nose = love.graphics.newImage('/resources/agenteyes.png'),
},

font = {
    f18 = love.graphics.newFont('/resources/font/Gabriela-Regular.ttf', 18),
    f24 = love.graphics.newFont('/resources/font/Gabriela-Regular.ttf', 24),
},

sound = {
    walk = love.audio.newSource("sound/wood.wav", "static"),
    walk2 = love.audio.newSource("sound/wood.wav", "static"),
},

}
