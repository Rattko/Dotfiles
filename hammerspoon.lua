-- Display a quick info containing time and battery level
hs.hotkey.bind({'cmd', 'alt'}, ';', function()
    local battery = math.floor(hs.battery.percentage()) .. '%'

    hs.alert.show(os.date('%I:%M%p') .. ' | ' .. battery)
end)

-- Center an active window
hs.hotkey.bind({'cmd', 'alt'}, 'c', function()
    hs.window.focusedWindow():centerOnScreen()
end)

-- Resize an active window to a fullscreen
hs.hotkey.bind({'cmd', 'alt'}, 'f', function()
    local window = hs.window.focusedWindow()
    local windowFrame = window:frame()
    local screenFrame = window:screen():frame()

    windowFrame.x = 0
    windowFrame.y = 0
    windowFrame.w = screenFrame.w
    windowFrame.h = screenFrame.h

    window:setFrame(windowFrame)
end)
