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

function moveFocusedWindow(position)
    hs.grid.set(hs.window.focusedWindow(), position)
end

-- Move the active window to the top left portion of the screen
hs.hotkey.bind(hyper, 'q', function()
    moveFocusedWindow({0, 0, gridWidth / 2, gridHeight / 2})
end)

-- Move the active window to the top half of the screen
hs.hotkey.bind(hyper, 'w', function()
    moveFocusedWindow({0, 0, gridWidth, gridHeight / 2})
end)

-- Move the active window to the top right portion of the screen
hs.hotkey.bind(hyper, 'e', function()
    moveFocusedWindow({gridWidth / 2, 0, gridWidth / 2, gridHeight / 2})
end)

-- Move the active window to the left half of the screen
hs.hotkey.bind(hyper, 'a', function()
    moveFocusedWindow({0, 0, gridWidth / 2, gridHeight})
end)

-- Move the active window to the centre of the screen
hs.hotkey.bind(hyper, 's', function()
    moveFocusedWindow({gridWidth / 4, gridHeight / 4, gridWidth / 2, gridHeight / 2})
end)

-- Move the active window to the right half of the screen
hs.hotkey.bind(hyper, 'd', function()
    moveFocusedWindow({gridWidth / 2, 0, gridWidth / 2, gridHeight})
end)

-- Move the active window to the bottom left portion of the screen
hs.hotkey.bind(hyper, 'z', function()
    moveFocusedWindow({0, gridHeight / 2, gridWidth / 2, gridHeight / 2})
end)

-- Move the active window to the bottom half of the screen
hs.hotkey.bind(hyper, 'x', function()
    moveFocusedWindow({0, gridHeight / 2, gridWidth, gridHeight / 2})
end)

-- Move the active window to the bottom right portion of the screen
hs.hotkey.bind(hyper, 'c', function()
    moveFocusedWindow({gridWidth / 2, gridHeight / 2, gridWidth / 2, gridHeight / 2})
end)


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
