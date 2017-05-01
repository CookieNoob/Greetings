local FindClients = import('/lua/ui/game/chat.lua').FindClients
local acu
local allPlayers

function init()
    allPlayers = GetAllPlayers()

    ReturnGreeting()
    
    acu = findACU()

    ForkThread(
        function()
            WaitSeconds(119)
            if acu == false then
                return 
            end
            while true do
                WaitSeconds(1)
                if acu:IsDead() then
                    local msg = { to = 'all', Chat = true, text = "gg wp. You did a phenomenal job in defeating me!"}
                    SessionSendChatMessage(allPlayers, msg)
                    WaitSeconds(1)
                    msg = { to = 'all', Chat = true, text = "well done my friend and congratulations for this extraordinary strategic masterpiece."}
                    SessionSendChatMessage(allPlayers, msg)
                    return
                end
            end
        end
    )
end


function GetAllPlayers()
    local result = {}
    for index,client in GetSessionClients() do
        table.insert(result, index)
    end
    return result
end

function ReturnGreeting()
    ForkThread(
        function()
            local msg
            WaitSeconds(1)
            msg = { to = 'all', Chat = true, text = "gl & hf and wish you a fair and nice game that we are allowed to have together now to this special moment."}
            SessionSendChatMessage(allPlayers, msg)
            WaitSeconds(1)
            msg = { to = 'all', Chat = true, text = "I will enjoy this game as nothing else today since it is a pleasure to play with you now!"}
            SessionSendChatMessage(allPlayers, msg)
            WaitSeconds(1)
            msg = { to = 'all', Chat = true, text = "My feelings are already flying up in the highest stars awaiting your first tanks coming."}
            SessionSendChatMessage(allPlayers, msg)
            WaitSeconds(1)
            msg = { to = 'all', Chat = true, text = "It will be the battle of the century which will be known ages after us."}
            SessionSendChatMessage(allPlayers, msg)
            WaitSeconds(1)
            msg = { to = 'all', Chat = true, text = "I will fight until the last tank and will never forfeit. Let the heroic adventure begin."}
            SessionSendChatMessage(allPlayers, msg)
        end
    )
end


function findACU()
    local avatars = GetArmyAvatars()
    if avatars and avatars[1]:IsInCategory("COMMAND") then
        local armiesInfo = GetArmiesTable()
        local focusArmy = armiesInfo.focusArmy
        local playerName = armiesInfo.armiesTable[focusArmy].nickname
        avatars[1]:SetCustomName(playerName)
    end
    return avatars[1]
end