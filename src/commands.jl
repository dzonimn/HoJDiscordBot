# all functions must receive client and message arguments!
using Discord

const DATA = (
    userpoints => Dict{"String", "Int"}(),
    usermoney => Dict{"String", "Int"}(),
    currentusersworking => String[]
) # not too certain how to store and load data. Databases?

function replypong(c::Client, m::Message)
    reply(c, m, "pong")
end

function replyping(c::Client, m::Message)
    reply(c, m, "ping")
end

function replytopleaderboard(c::Client, m::Message)
    # Unfold data and create Embed to show rich content
    # https://posts.xh4h.com/Discord.jl/dev/types/#Discord.Embed
    # Some tools
    # https://leovoel.github.io/embed-visualizer/
    # https://cog-creators.github.io/discord-embed-sandbox/
    reply(c, m, DATA.userpoints)
end

function workcontroller(c::Client, m::Message)
    # check if user has been working
    # if so, stop work
    # else, start work
end