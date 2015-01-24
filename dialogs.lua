return {
    ticket_man = {
        {'Hello, Tickets please!', 
            {"It's in the other coupé#2", "I'm a freeloader#3"}},
        {'You have two minutes to find it', {'Ok#0'}},
        {'A freeloader?!', {'Yes#4'}},
        {'A FREELOADER?!?!?!?!? NOT ON MY TRAIN! OUT!', {'Game over#1'}},
    },
    agent = {
        {"Can I help you? By the way I'm Bond, Jam- I mean. I'm Smith, John Smith.\n(Whispers smooth to himself)",
            {'Hello, do you have a spare ticket?#2'}},
        {'No.',
            {'Bye#0'}},
    },

    agent = {
        {"Can I help you? By the way I'm Agent...- I mean. I'm Smith, John Smith.",
            {'Hello, do you have a spare ticket?#2','I totally know about the microfilm.#3','Are you afraid of anything?#5'}},
        {'No my ticket lies firmly on the table with my name on it.',
            {"Bye.#0"}},
        {"How can you know about the ... ah I see you're kidding\nI to was kidding.",
            {"You are the worst agent#4","Do you have a spare ticket#2","Bye#0"}},
        {"Im not! I'm the best agent you'll ever..I mean I'm not an agent",
            {"Do you have a spare ticket#2","Are you afraid of anything?#5","Bye#0"}},
        {"An agent can't be afraid, especially not fire..\n...I'm not an agent though",
            {"Do you have a spare ticket#2", "The paperbin is on fire right now#6", "Bye#0"}},
        {"Aaaah, wait I'ts not you meany!",
            {"You are the worst agent#4", "Bye#0"}},

    },

    --[[waitress = {
        {"Hello! Can I get you something?",
            {"Yes I'd like to buy some coffee#2", "No thank you, I'm good!#0"}},
        {"Ok, that'll cost you 20$",
            {"20$!? I don't have that kind of money!#3"}},
        {"Well... I'll cut you a deal. If you can guess how many coffee beans are in the jar to the left of me I'll give you some free coffee.",
            {"Easy, it's 27#4", "Obviously, the resolution to your bone of contention is the riposte that the proportion of integers of beans the vessel contains is merely the 
              number thirtythree#5", "I would guess 33#4", "I have no idea#6"}},
        {"Nope! That's the wrong answer!#0"},
        {"Correct! Here have some coffee!#0"},
        {"Well that's why you have to guess, stupid!#3"}}
    },
    dustbin = {
        {"Hello, please don't put me on fire. I have a wife and kids",
            {"I would if I could, dustbin. Sadly I don't have any matches.#2"}}
        {"...",{"Now if you excuse me I have a ticket to catch!#0"}}
    },
    closet = {
        {"Yikes! close the closet! We're hiding from the conductor!", {"Do you have room for one more?#2"}},
        {"Yes just hurry up and get in!", {"Ok!#0"}}
    },

    dustbin_level3 = {
        {"Hello, please don't put me on fire. I have a wife and kids",
            {"Put on fire#2"}},
        {"Please.... I am merely a bin collecting paper. Don't do this to me...",
            {"Proceed to put on fire#3"}},
        {"WAIT, NO NO NO NO. I'LL TELL YOU WHAT YOU NEED TO KNOW. PLEASE ANYTHING!",
            {"There's nothing you can say now, bin"}}}

    
    ]]
}
