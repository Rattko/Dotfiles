-- Display a quick info containing time and a battery level
hs.hotkey.bind({'cmd', 'alt'}, ';', function()
    local battery = math.floor(hs.battery.percentage()) .. '%'

    hs.alert.show(os.date('%I:%M%p') .. ' | ' .. battery)
end)

-- Center an active window
hs.hotkey.bind({'cmd', 'alt'}, 'c', function()
    hs.window.focusedWindow():centerOnScreen()
end)

-- Maximize an active window
hs.hotkey.bind({'cmd', 'alt'}, 'f', function()
    hs.window.focusedWindow():maximize()
end)
