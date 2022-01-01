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

-- TODO
hs.hotkey.bind({'ctrl'}, '-', function()
    local name = 'Mail'
    local app = hs.application.get(name)

    if app then
        if not app:mainWindow() then
            app:selectMenuItem({"kitty", "New OS window"})
        elseif app:isFrontmost() then
            app:hide()
        else
            app:activate()
        end
    else
        watcher = hs.application.watcher.new(function(name, event, app)
            if event == hs.application.watcher.launched then
                app:mainWindow():setFullScreen(true)
            end
        end)

        watcher:start()

        hs.application.open(name)
    end
end)
