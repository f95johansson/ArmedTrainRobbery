return {
    ticket_man = {
        {'Hello, Tickets please!', 
            {"It's in the other coupé#2", "I don't have one#3"}},
        {'You have two minutes to find it', {'Ok#0'}},
        {'Do you intend to pay for one then?!', {"With cash#5","I thought maybe I could ride for free#4"}},
        {'FOR FREE?!?!?!?!? NOT ON MY TRAIN! OUT!', {'Game over#1'}},
        {"You don't seem to have any money!", {"About that..can I ride for free instead#4","My ticket is in the other coupé#2"}},
    },
    agent = {
        {"Can I help you? By the way I'm Bond, Jam- I mean. I'm Smith, John Smith.\n(Whispers smooth to himself)",
            {'Hello, do you have a spare ticket?#2'}},
        {'No.',
            {'Bye#0'}},
    },

    agent = {

        {"Can I help you? By the way I'm Agent Vincent mc Ni...\nI mean, I'm Smith, John Smith.",
            {'Hello, do you have a spare ticket?#2','I totally know about the microfilm.#3','Are you afraid of anything?#5'}},

        {'No my ticket lies firmly on the table with my name on it.',
            {"Bye.#0"}},
        {"How can you know about the ... ah I see you're kidding\nI to was kidding.",
            {"You are the worst agent#4","Do you have a spare ticket#2","Bye#0"}},
        {"Im not! I'm the best agent you'll ever..I mean I'm not an agent",
            {"Do you have a spare ticket#2","Are you afraid of anything?#5","Bye#0"}},
        {"An agent can't be afraid, especially not fire..\n...I'm not an agent though",
            {"Do you have a spare ticket#2","The paperbin is on fire right now#6","Bye#0"}},
        {"Aaaah, wait the paperbin is not on fire you meany!",
            {"You are the worst agent#4", "Bye#0"}},

    },

    --[[chef = {
        {"Hello! Can I get you something?",
            {"Yes I'd like to buy some coffee#2", "No thank you, I'm good!#0"}},
        {"Ok, that'll cost you 20$",
            {"20$!? I don't have that kind of money!#3","I don't need anything#0"}},

        {"Well... I'll cut you a deal. If you can guess how many coffee beans\nare in the jar to the left of me\nI'll give you some free coffee if you guess correctly.",
            {"Easy, it's 27#4","I have no idea#6","I don't wanna guess#0","Obviously, the resolution to your bone of contention is the riposte\nthat the proportion of integers of beans the vessel contains\nis merely the number thirtyfour#5"}},

        {"Nope! That's the wrong answer, try again!\nHow many beans are there in the jar",{"I don't wanna guess#0","Obviously, the resolution to your bone of contention is the riposte\nthat the proportion of integers of beans the vessel contains\nis merely the number thirtyfour#5""}},
        {"Correct! Here have some coffee!"{"Oh thank you#0"}},
        {"Well that's why you have to guess, stupid!"{"I am stupid,bye#0","Ok#7"}}
        
          {"Can you guess how many coffee beans\nare in the jar to the left of me\nI'll give you some free coffee if you guess correctly.",
            {"Easy, it's 27#4","I have no idea#6","I don't wanna guess#0","Obviously, the resolution to your bone of contention is the riposte\nthat the proportion of integers of beans the vessel contains\nis merely the number thirtyfour#5"}},   

    },
    dustbin = {
        {"Hello, please don't put me on fire. I have a wife and kids",
            {"I would if I could, dustbin. Sadly I don't have any matches.#2","I would never do such a horrific thing#3"}}
        {"You frighten me arcinist!",{"Now if you excuse me I have a ticket to catch!#0"}}
        {"Some people are monsters.#0",{"Not me, I'm nice and stuff, bye#0"}}
    },
    closet = {
        {"Yikes! close the closet! We're hiding from the conductor!", {"Do you have room for one more?#2","Oh, lets close that door then.#0","Whats your favourite pizza?#3"}},
        
        {"Yes just hurry up and get in!", {"Ok!#0"}}

        {"There is no time to talk about pizza", {"Ok I'll close the door!#0","Why aren't there any toilets on this train?#4","Sometime if I look up the star it
        reminds me that we are so\nsmall.#6",""}}

        {"I don't know, mayby people don't need one beacuse\nthe train does not go very far\nnow please close the door",
            {"Ok I'll leave you alone!#0","But there are several beds in this train#4","Sometime if I look up the star it
            reminds me that we are so\nsmall.#7",""}}

        {"I don't know, mayby people don't need one beacuse\nthe train does not go very far\nnow please close the door",
            {"Ok I'll leave you alone!#0","Can I get in?#1","But there are several beds in this train#6","Sometime if I look up the star it
            reminds me that we are so\nsmall.#7"}}

        {"That is a very good point, if I let you in would you please stop talking!",
            {"I'll go away instead.#0","Yes please#1"}}

        {"What, this is no time for poetry, please close the door",
            {"If you don't accept my poetry you don't accept me. Bye!#0","Can I come inside#1","But you know, our action really matters even though we are small\n beacuse together we are big!#8"}}

        {".......Come into the closet or go away",
            {"I'll go away.#0","I'll come in#1"}}  
    }

    },

    dustbin_level3 = {
        {"Hello, please don't put me on fire. I have a wife and kids",
            {"I won't put you on fire (put on fire)#3","You will burn (put on fire)#2"}},

        {"Please.... I am merely a bin collecting paper. Don't do this to me...",
            {"Proceed to put on fire#4"}},

        {"Oh thank you, you are a kind soul",
            {"Proceed to put on fire#4"}},

        {"WAIT, NO NO NO NO. I'LL TELL YOU WHAT YOU NEED TO KNOW. PLEASE ANYTHING!",
            {"There's nothing you can say now, it's bin a pleasure knowing you.#0","I will trash you#0","<Refuse to make a pun about such a serious situation>#5"}}}

        {"OH PLEASE, IVE BIN A GOOD BIN",
            {"I hate puns, burn!!!#0","Nice pun, burn!#0"}},

    ticket = {
        {"I'm sooooooooooo tiread of travelling with that stupid agent",
            {"He isn't that stupid!","Is he an agent?","Preaching to the quire sister!"}},

        {"Please.... I am merely a bin collecting paper. Don't do this to me...",
            {"Proceed to put on fire#4"}},

        {"Oh thank you, you are a kind soul",
            {"Proceed to put on fire#4"}},

        {"WAIT, NO NO NO NO. I'LL TELL YOU WHAT YOU NEED TO KNOW. PLEASE ANYTHING!",
            {"There's nothing you can say now, it's bin a pleasure knowing you.#0","I will trash you#0","<Refuse to make a pun about such a serious situation>#5"}}}

        {"OH PLEASE, IVE BIN A GOOD BIN",
            {"I hate puns, burn!!!#0","Nice pun, burn!#0"}},
    
    ]]
}
