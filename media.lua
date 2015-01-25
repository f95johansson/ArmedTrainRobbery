return {

image = {
    temp_background = love.graphics.newImage('/resources/temp_bg.png'),
    background = love.graphics.newImage('/resources/bak1.png'),
    paralax1 = love.graphics.newImage('/resources/bak1a.png'),
    paralax2 = love.graphics.newImage('/resources/bak1b.png'),
    paralax3 = love.graphics.newImage('/resources/bak1c.png'),
    paralax4 = love.graphics.newImage('/resources/bak1d.png'),
    grass_bg = love.graphics.newImage('/resources/grass.png'),
    level2 = love.graphics.newImage('/resources/level2.png'),
    mask2 = love.graphics.newImage('/resources/mask2.png'),
    level1 = love.graphics.newImage('/resources/level1.png'),
    mask1 = love.graphics.newImage('/resources/mask1.png'),
    level3 = love.graphics.newImage('/resources/level3.png'),
    mask3 = love.graphics.newImage('/resources/mask3.png'),
    question_bg = love.graphics.newImage('/resources/question_bg.png'),

    player = love.graphics.newImage('/resources/player.png'),
    
    ticket_man = love.graphics.newImage('/resources/ticket_man.png'),
    ticket_man_dialog = love.graphics.newImage('/resources/ticket_man_dialog.png'),
    ticket_man_nose = love.graphics.newImage('/resources/ticket_man_nose.png'),
    ticket_man_left_arm = love.graphics.newImage('/resources/kondhandL.png'),
    ticket_man_right_arm = love.graphics.newImage('/resources/kondhandR.png'),

    agent_left_arm = love.graphics.newImage('/resources/agentarmL.png'),
    agent_right_arm = love.graphics.newImage('/resources/agentarmR.png'),
    agent = love.graphics.newImage('/resources/agent.png'),
    agent_dialog = love.graphics.newImage('/resources/agentbod.png'),
    agent_nose = love.graphics.newImage('/resources/agenteyes.png'),

    chef = love.graphics.newImage('/resources/kok_icon.png'),
    chef_left_arm = love.graphics.newImage('/resources/kokhandL.png'),
    chef_right_arm = love.graphics.newImage('/resources/kokhandR.png'),
    chef_dialog = love.graphics.newImage('/resources/kok.png'),
    chef_nose = love.graphics.newImage('/resources/kokhatt.png'),

    trash_can = love.graphics.newImage('/resources/trash_can.png'),
    trash_can_dialog = love.graphics.newImage('/resources/pappersbody.png'),
    trash_can_nose = nil,
    trash_can_left_arm = love.graphics.newImage('/resources/pappersarm.png'),
    trash_can_right_arm = love.graphics.newImage('/resources/pappersarm.png'),

    trash_can2 = love.graphics.newImage('/resources/trash_can.png'),
    trash_can2_dialog = love.graphics.newImage('/resources/pappersbody.png'),
    trash_can2_nose = nil,
    trash_can2_left_arm = love.graphics.newImage('/resources/pappersarm.png'),
    trash_can2_right_arm = love.graphics.newImage('/resources/pappersarm.png'),

    ticket = love.graphics.newImage('/resources/ticket_icon.png'),
    ticket_left_arm = love.graphics.newImage('/resources/ticket_arm.png'),
    ticket_nose = nil,
    ticket_right_arm = love.graphics.newImage('/resources/ticket_arm.png'),
    ticket_dialog = love.graphics.newImage('/resources/ticket.png'),

    closet = love.graphics.newImage('/resources/closet_icon.png'),
    closet_nose = love.graphics.newImage('/resources/closet_nose.png'),
    closet_left_arm = love.graphics.newImage('/resources/closet_arm_left.png'),
    closet_right_arm = love.graphics.newImage('/resources/closet_arm_right.png'),
    closet_dialog = love.graphics.newImage('/resources/closet.png'),

},

font = {
    f18 = love.graphics.newFont('/resources/font/Gabriela-Regular.ttf', 18),
    f24 = love.graphics.newFont('/resources/font/Gabriela-Regular.ttf', 24),
    f48 = love.graphics.newFont('/resources/font/Gabriela-Regular.ttf', 48),
},

sound = {
    walk = love.audio.newSource("sound/wood.ogg", "static"),
    walk2 = love.audio.newSource("sound/wood.ogg", "static"),
    main_theme = love.audio.newSource("sound/main.ogg"),
    intro_theme = love.audio.newSource("sound/intro.ogg"),
    agent_theme = love.audio.newSource("sound/agent.ogg"),
    ticket_man_theme = love.audio.newSource("sound/conductor.ogg"),
    driver_theme = love.audio.newSource("sound/driver.ogg"),

},

}
