module HoJDiscordBot

using Discord
using Dates

const ENV["DISCORD_TOKEN"] = read("secrets/BotToken.txt", String)

function main()
    client = Client(ENV["DISCORD_TOKEN"]; prefix='!')
    
    include("handlers.jl")
    include("commands.jl")

    # --------------- Handlers ---------------
    # The bot listens to all events in the servers and DMs it is in
    # and handles them with a specified function in handlers.jl
    # example: add_hander!(client, Event, function)
    # List of events can be found @ https://posts.xh4h.com/Discord.jl/dev/events/
    # https://posts.xh4h.com/Discord.jl/dev/client/#Discord.add_handler!
    add_handler!(client, MessageCreate, handleping)
    add_handler!(client, MessageCreate, handlepong; tag=:messagepong) # function can be tagged to be deleted later
    delete_handler!(client, MessageCreate, :messagepong) # bot will not reply to "pong"
    
    # --------------- User Commands ---------------
    # The bot listens to user messages with the specified prefix (!)
    # and runs a function
    # example: add_command!(client, :commandname, function)
    # https://posts.xh4h.com/Discord.jl/dev/client/#Discord.add_command!
    add_command!(client, :ping, replypong; help="Replies pong")
    add_command!(client, :pong, replyping; help="Replies pong")
    add_command!(client, :top, replyworkleaderboard; help="Shows top workers")
    add_command!(client, :work, workcontroller; help="Start work")

     # I forget how 55 seconds came to be but I felt it gave Julia enough time to compile or something
    @sync open(client, delay=Second(55))
    return client
end

end


while true
    @info "Bot starting up"
    client = HoJDiscordBot.main()
    @info "Bot logging in"
    wait(client)
    # not too sure if this actually works in preventing lost connections yet
    @info "Lost connection to Discord, restarting bot."
end