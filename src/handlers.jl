# all functions must receive client and event arguments!
using Discord

function handleping(c::Client, e::MessageCreate)
    if e.message.content == "ping"
        reply(c, e.message, "pong")
    end
end

function handlepong(c::Client, e::MessageCreate)
    if e.message.content == "pong"
        reply(c, e.message, "ping")
    end
end