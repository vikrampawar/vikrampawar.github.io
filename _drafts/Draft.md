
# Blog post about trying out claud code 


I ahve been using Github Copilot since it's inception and I have had subscription for most of that time.

Main uses were
- use it like a powerful auto complete. however had to explicitly stop it several times during this time. as it was coming in the way.
- generate commmandline commands and run it using select text and run in terminal feature which I bind to F1. this helped to first create  complicated commands with arguments very effectively by using a # comment on what I want to achieve and then let the auto complete suggest the command, then I could press F1 to execute it. This worked really well.
- I also used it to generate example code by writing comments.
- I'd use chat to ask questions about code that I'm browsing.

All these saved me time, but I don't know if I could say I was productive.

As a senior developer, I don't spend too much time coding. 
I can quickly accomplish what I need if languages and frameworks I'm familiar with.
I may use the copilot as a crutch when I'm learning something new. 
It allowed me to do things quickly, but also hindered my learning as I always remanined dependant on it.
So I was't entirely convinced of using it all the time, as I found that I won't learn new tech deeply enough and also I'd get rusty even of tech I'm familiar with.
So I flip flopped between using it and not using it to ensure that I'm both using it and also not forgetting what I know or how I learn things without it.

Although I was reading about agentic coding by replit, cursor etc. It was quite obvious it would work only when you start from scratch and they all struggle on existing large and complex code bases. I tried replit on some but wasn't convinced it will help me in my daily work.

Copilot introduced agents (put link here)

I used it to create a SpringBoot project based on existing one using Claude 3.5(3.7?) as the model.
It wasn't a complicated piece of work, but would take time to get it right.
It would have taken me 2 to 3 days.
I was able to do that work in half a day while learning about how to use agentic coding on copilot.
I also documented and added tests etc a lot better than what I'd have normally done.
That blew my mind.
I instantly saw how useful it will be.
I suddenly started working on a lot of personal projects to explore using it and was quite surprised how quickly I was getting all personal projects done, documented and tested. All with Claude 3.5/3.7 as model, although I had other options, they never worked as well as claude.
I may write posts about some of them.

in the initial week, I instantly saw the need for the following and most of my time was spent it getting it to do these things.
I don't think all this was available out of the box, as after a month or so I read about using instructions file etc in vscode copilot.

- making the agent document what it's doing
- saving how it's working, what it created, what it learned etc as document to serve as its memory
- save my prompts
- improve my prompts
- create batch scripts to do tasks first, rather than trying to do it itself.

This was my background of using ai coding agents.

I read about claude code and also saw the intro video. 
It looked impressive and I didn't feel that it would so much of a jump from copilot agents I'm already using and got familiar with.
Also, per API call cost is something that's bit difficult for me to digest as I'd be more concerned and trying to optimise for reducing cost rather than for getting my work done efficiently.

So, I was delighted to see that Anthropic offered a monthly plan starting with a reasonable ~ £15 per month.
I may go for the higher one in future, but it is good to start and actually see the benefits first to justify that, especially when I already have copilot subscriptino in whcih I'm actually using claude!.

Although I'm quite comfortable on command line know vi, can use vi bindings on commandline and see benefits of command line etc, still I did feel that having a coding assitant in commandline will be constraining.

Right from day 1, I immediately could see why commandline is the best option for a coding assistant.

Commandline is the most efficient way to get anything done, if we know the commands.
Everything comes to us. We just write commands, and control what's produced etc depending on our appetite to see.
There is a lot of programmatic control possibitites that have been honed over the the last 30 odd years by countless great individuals.
And all of them have the same basic interface. Imagine millions of programmers creating what's basically a commmandline program that can do anything.
There isn't a importatn program that isn't available as a command.
Event git is a command line program.

Now the assistant has access to all this, it knows all the commands, so you don't have to remember any, ujust to have not very vague idea of what the commands are etc.

More over claude had all the things built in that I was trying to create with copilot agent - documenting owrk, saving to memory etc.

The killer feature is that it controls what it shows you. So you are not looking at too much stuff at a time when you want to actually see what it's doing.

I've used it on some complicated SpringBoot projects using compplicaetd PostGIS database with custom routing queries etc and am not having to use the editor although I run claude code in vscode temrinal. I can always tell it what I want and it does it quickly. It's remarkable quick compared to copilot, so don't mind it doing things that I could do myself quickly. It's painful to wait for an agent to do something when you can do it quickly yourself.
That happens a lot with copilot, but with claude it rarely happens, even then I can do escape and tell claude what to do exactly and it does it quickly then.

It's only been a week or so since I've started using it, but I can already see that it will be my main coding assistant for some time.
Any other coding agent has to be commandline one I think to beat it.

There are also a lot of other factos in favour of claude code

- anthorpic also created the model, so they know it really well.
- they use it extensively themselves - dog fooding
- they document it really well, possibly using claude a lot
- inherent other advantages of commandline - less code for them to write and test etc
- there's minimal asthetic to whatever anthropic does that I've seen and udnerstood. Only two models sonnet and opus. Using commandline, not too many installation instructions or setup requiremetns etc, start small and discover yourself 

Over the comming weeks, I'll be using it extensively for my personal projects and oducmeting my journey.


## command line


- Keep focussed on commandline and claude code commandline as I'm writing several posts covering other topics
- Coding assistants can do a lot of work themselves, however all work requires consuming tokens and processing them etc. So for many tasks, it makes sense to either use a commandline tools that works with text (grep, find etc) to both do the work precicely, quickly and and without using tokens. A lot of the time it makes sense to ask the agent to create this batch tool first. I don't know if claude code does create such scripts on the fly, but it's possible that it does. Even in my own workflow with claude code and also copilot a lot of the times, instead of asking the agent to do the work I ask it to create a batch script and then run it. All this work is more appropriate in a commandline, and of course all of the little batch tools will work well with other existing tools as they all have the simple pipe interface.
- Commandline interfaces are good to read these days as they have color, and all the claude ai output is formatted nicely.
- I can quickly find ways to improve it as it's like any other command line program which I find difficult with other agents that are not commandline.
-  






