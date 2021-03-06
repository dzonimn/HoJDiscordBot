# HoJDiscordBot Template
This repo serves as a template for the Humans of Julia Discord bot. Fork and tailor it to your liking.

I'm not actually sure what are the intended features of the bot, so any functions already defined within are just examples.

The documentation can be found at https://posts.xh4h.com/Discord.jl/dev.

## General notes
- Obtain the API key for the Discord Bot. More information at https://discordpy.readthedocs.io/en/latest/discord.html. The bot must receive authorization by the server creator to be able to be in it and listen.
- Use `add_handler!()` and `add_command!()` in `src/HoJDiscordBot.jl` and create methods within their respective files (`handlers.jl` or `commands.jl`) to extend the bot's capabilities.
  - `handlers` are events that happen in a server. The bot listens to all relevant `AbstractEvent`s and runs function(s) that deal with it.
  - `commands` are user commands that are typed by users. By default, the prefix has been set to `!`.
  - All methods have to receive a `Discord.Client` object with a `Discord.Message` or `Discord.AbstractEvent` object, no less. 
- Commands that take in arguments, like `!command <arg1> <arg2>` will need their associated methods to receive extra arguments. 
```julia
function command(c::Client, m::Message, arg1, arg2)
    # code in here
end
```

## Issues
- The only way I can figure out how to handle data is to use `const`s within their respective files, and/or to maintain a database somewhere. Currently I'm not sure how this should be best implemented, but feel free to refactor it when a proper solution is found.
- The documentation contains a lot of information that could be helpful to do what we need.