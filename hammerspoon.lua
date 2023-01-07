hyper = {'cmd', 'alt', 'ctrl'}
hyperShift = {'cmd', 'alt', 'ctrl', 'shift'}
configFileLoc = os.getenv('HOME') .. '/Coding/Personal/Dotfiles/hammerspoon.lua'

-- Automatically relaunch Hammerspoon when this file is updated
reloader = hs.pathwatcher.new(configFileLoc, hs.relaunch):start()

-- Relaunch Hammerspoon on demand
hs.hotkey.bind(hyper, '§', hs.relaunch)


function launchApp(appName)
    local app = hs.application.get(appName)

    if app and app:isFrontmost() then
        app:hide()
    else
        hs.application.launchOrFocus(appName)
    end
end

-- Bring up Kitty
hs.hotkey.bind({'ctrl'}, ';', function()
    launchApp('kitty')
end)

-- Bring up Dash
hs.hotkey.bind({'ctrl'}, '\'', function()
    launchApp('Dash')
end)

-- Bring up Safari
hs.hotkey.bind({'ctrl'}, '\\', function()
    launchApp('Safari')
end)
