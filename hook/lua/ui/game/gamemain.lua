local originalCreateUI = CreateUI

function CreateUI(isReplay, parent)
    originalCreateUI(isReplay)
    if not isReplay then
        import("/mods/Greetings/script/greetings.lua").init()
    end
end
