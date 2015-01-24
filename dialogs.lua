return {
    ticket_man = {
        {'Hello, Tickets please!', 
            {"It's in the other coupé#2", "I'm a freeloader#3"}},
        {'You have two minutes to find it', {'Ok#0'}},
        {'A freeloader?!', {'Yes#4'}},
        {'A FREELOADER?!?!?!?!? NOT ON MY TRAIN! OUT!', {'Game over#1'}},
    },
    agent = {
        {'Question',
            {'answer 1#1', 'answer 2#2'}},
    },
    waitress = {
        {"Hello! Can I get you something?",
            {"Yes I'd like to buy some coffee#2", "No thank you, I'm good!#0"}},
        {"Ok, that'll cost you 20$",
            {"20$!? I don't have that kind of money!#3"}},
        {"Well... I'll cut you a deal. If you can guess how many coffee beans are in the jar to the left of me I'll give you some free coffee.",
            {"Easy, it's 27#4", "Obviously, the resolution to your bone of contention is the riposte that the proportion of integers of beans the vessel contains is merely the number thirtythree#5", "I would guess 33#4", "I have no idea#6"}},
        {"Nope! That's the wrong answer!#0"},
        {"Correct! Here have some coffee!#0"},
        {"Well that's why you have to guess, stupid!#3"}}
}
