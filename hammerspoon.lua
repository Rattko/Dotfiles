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

-- Customise the appearance of the grid
hs.grid.ui.textColor = {1, 1, 1, 1}
hs.grid.ui.textSize = 150
hs.grid.ui.cellColor = {0, 0, 0, 0.25}
hs.grid.ui.cellStrokeColor = {0, 0, 0, 1}
hs.grid.ui.cellStrokeWidth = 5
hs.grid.ui.highlightColor = {28 / 255, 54 / 255, 75 / 255, 0.5}
hs.grid.ui.highlightStrokeColor = {28 / 255, 54 / 255, 75 / 255, 1}
hs.grid.ui.highlightStrokeWidth = 10
hs.grid.ui.selectedColor = {163 / 255, 70 / 255, 54 / 255, 0.8}
hs.grid.ui.showExtraKeys = false
hs.grid.ui.fontName = 'Fira Code'

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
