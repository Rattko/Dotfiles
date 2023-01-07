hyper = {'cmd', 'alt', 'ctrl'}
hyperShift = {'cmd', 'alt', 'ctrl', 'shift'}
configFileLoc = os.getenv('HOME') .. '/Coding/Personal/Dotfiles/hammerspoon.lua'

gridWidth = 5
gridHeight = 4

-- Automatically relaunch Hammerspoon when this file is updated
reloader = hs.pathwatcher.new(configFileLoc, hs.relaunch):start()

-- Relaunch Hammerspoon on demand
hs.hotkey.bind(hyper, '§', hs.relaunch)


-- Set up a grid for a window manipulation
screenFrame = hs.screen.mainScreen():frame()

hs.grid.setGrid(
    hs.geometry.size(gridWidth, gridHeight),
    hs.screen.mainScreen(),
    {screenFrame.x + 10, screenFrame.y + 10, screenFrame.w - 20, screenFrame.h - 20}
)
hs.grid.setMargins(hs.geometry.size(0, 0))

-- Disable animations
hs.window.animationDuration = 0

-- Toggle the grid on and off
hs.hotkey.bind(hyper, '`', hs.grid.toggleShow)


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
