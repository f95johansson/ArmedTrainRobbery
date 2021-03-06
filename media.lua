return {

image = {
    temp_background = love.graphics.newImage('/resources/temp_bg.png'),
    background = love.graphics.newImage('/resources/bak1.png'),
    paralax1 = love.graphics.newImage('/resources/bak1a.png'),
    paralax2 = love.graphics.newImage('/resources/bak1b.png'),
    paralax3 = love.graphics.newImage('/resources/bak1c.png'),
    paralax4 = love.graphics.newImage('/resources/bak1d.png'),

    iparalax0 = love.graphics.newImage('/resources/intro4.png'),
    iparalax1 = love.graphics.newImage('/resources/intro3.png'),
    iparalax2 = love.graphics.newImage('/resources/intro2.png'),
    iparalax3 = love.graphics.newImage('/resources/intro1.png'),
    iparalax4 = love.graphics.newImage('/resources/intro0.png'),

    introTrain = love.graphics.newImage('/resources/introTrain.png'),

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
    chef_background = love.graphics.newImage('/resources/chef_background.png'),

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
    closet_nose = nil,
    closet_left_arm = love.graphics.newImage('/resources/garderob_left.png'),
    closet_right_arm = love.graphics.newImage('/resources/garderob_right.png'),
    closet_dialog = love.graphics.newImage('/resources/garderobare.png'),
    closet_background = love.graphics.newImage('/resources/closet_background.png'),

    go_hide = love.graphics.newImage('/resources/gohide_icon.png'),
    go_hide_nose = nil,
    go_hide_left_arm = love.graphics.newImage('/resources/gohide_left.png'),
    go_hide_right_arm = love.graphics.newImage('/resources/gohide_right.png'),
    go_hide_dialog = love.graphics.newImage('/resources/gohide.png'),

    driver = love.graphics.newImage('/resources/gohide_icon.png'),
    driver_nose = nil,
    driver_left_arm = love.graphics.newImage('/resources/1x1.png'),
    driver_right_arm = love.graphics.newImage('/resources/1x1.png'),
    driver_dialog = love.graphics.newImage('/resources/lokdrivwake.png'),
    driver_background = love.graphics.newImage('/resources/driver_background.png'),

    driver2 = love.graphics.newImage('/resources/gohide_icon.png'),
    driver2_nose = nil,
    driver2_left_arm = love.graphics.newImage('/resources/1x1.png'),
    driver2_right_arm = love.graphics.newImage('/resources/1x1.png'),
    driver2_dialog = love.graphics.newImage('/resources/lokdrivwake.png'),
    driver2_background = love.graphics.newImage('/resources/driver_background.png'),

    bird_man = love.graphics.newImage('/resources/gohide_icon.png'),
    bird_man_nose = nil,
    bird_man_left_arm = love.graphics.newImage('/resources/1x1.png'),
    bird_man_right_arm = love.graphics.newImage('/resources/1x1.png'),
    bird_man_dialog = love.graphics.newImage('/resources/ftant.png'),

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
    voice1 = love.audio.newSource("sound/voice1.mp3"),
    voice2 = love.audio.newSource("sound/voice2.mp3"),
    voice3 = love.audio.newSource("sound/voice3.mp3"),
    agent_voice = love.audio.newSource("sound/voice3.mp3"),

},

}
