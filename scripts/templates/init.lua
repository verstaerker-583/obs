-- internal
local Mode00w = 1440
local Mode00h = 900

local Mode01w = 1440
local Mode01h = 900
--local Mode01w = 1920
--local Mode01h = 1200

-- external
local Mode10w = 1920
local Mode10h = 1080
--local Mode01w = 3840
--local Mode01h = 2160
--local Mode01w = 5120
--local Mode01h = 2880

local Mode11w = 1280
local Mode11h = 720

-- Audio
local headsetInput = 50
local headsetOutput = 50

local builtinInput = 100
local builtinOutput = 50

function Launch()
    preFlightCloseApps()
    tweakOSX()
    preFlightSystem()
    preFlightScreens()
    hs.execute(
        "open -a OBS --args --always-on-top --collection 'gp' --disable-notifications --disable-updater --enable-media-stream --profile 'gpYTsq' --startstreaming --startvirtualcam --unfiltered_log --verbose"
    )
    preFlightWindows()
end

function postFlight()
    -- System
    hs.execute("defaults write com.apple.finder CreateDesktop -bool true")
    hs.execute("killall Finder")

    -- Audio
    hs.osascript("set volume alert volume 100")
    devices = hs.audiodevice.allDevices()
    for i, dev in ipairs(devices) do
        dev:setMuted(false)
        dev:setInputMuted(false)
        dev:setVolume(25)
        dev:setInputVolume(50)
        if dev:transportType() == "Built-in" then
            dev:setDefaultInputDevice()
            dev:setDefaultOutputDevice()
        end
    end

    -- Power Management
    hs.caffeinate.set("system", false, false)

    -- Screens
    local devices = hs.screen.allScreens()
    for i, dev in ipairs(devices) do
        dev:desktopImageURL("file:///System/Library/Desktop%20Pictures/Big%20Sur.heic")
        -- dev:desktopImageURL("file:///System/Library/CoreServices/DefaultDesktop.heic")

        if dev == hs.screen.primaryScreen() then
            if not dev:setMode(Mode00w, Mode00w, 2) then
                dev:setMode(Mode00w, Mode00h, 1)
            end
        else
            if not dev:setMode(Mode10w, Mode10w, 2) then
                dev:setMode(Mode10w, Mode10h, 1)
            end
        end
    end
end

function preFlightAudio()
    local headset = false

    -- Audio Output Devices
    hs.osascript("set volume alert volume 0")
    for _, dev in ipairs(hs.audiodevice.allOutputDevices()) do
        dev:setBalance(0.5)
        dev:setMuted(false)
        if dev:transportType() == "Built-in" then
            if dev:jackConnected() or dev:uid() == "BuiltInHeadphoneOutputDevice" then
                dev:setVolume(headsetOutput)
            else
                dev:setVolume(builtinOutput)
            end
        elseif dev:name() == "BlackHole 2ch" then
            dev:setDefaultOutputDevice()
            dev:setVolume(100)
        else
            dev:setVolume(25)
            dev:setMuted(true)
        end

        local x = {}
        x.balance = dev:balance()
        x.jack = dev:jackConnected()
        x.muted = dev:muted()
        x.name = dev:name()
        x.transport = dev:transportType()
        x.uid = dev:uid()
        x.volume = dev:volume()

        log.f("🔈\n%s", hs.inspect(x))
    end

    x = hs.audiodevice.current(false)
    x.balance = hs.audiodevice.defaultOutputDevice():balance()
    x.device = nil
    x.jack = hs.audiodevice.defaultInputDevice():jackConnected()
    x.transport = hs.audiodevice.defaultOutputDevice():transportType()

    log.f("🔈🔴\n%s", hs.inspect(x))

    -- Audio Input Devices
    for _, dev in ipairs(hs.audiodevice.allInputDevices()) do
        dev:setBalance(0.5)
        dev:setInputMuted(false)
        if dev:transportType() == "Built-in" then
            if dev:jackConnected() or dev:uid() == "BuiltInHeadphoneInputDevice" then
                dev:setInputVolume(headsetInput)
                headset = dev:setDefaultInputDevice()
            else
                dev:setInputVolume(builtinInput)
                if not headset then
                    dev:setDefaultInputDevice()
                end
            end
        else
            dev:setInputVolume(25)
            dev:setInputMuted(true)
        end

        local x = {}
        x.balance = dev:balance()
        x.jack = dev:jackConnected()
        x.muted = dev:inputMuted()
        x.name = dev:name()
        x.transport = dev:transportType()
        x.uid = dev:uid()
        x.volume = dev:inputVolume()
        x.ovolume = dev:outputVolume()

        log.f("🎙\n%s", hs.inspect(x))
    end

    x = hs.audiodevice.current(true)
    x.balance = hs.audiodevice.defaultInputDevice():balance()
    x.device = nil
    x.jack = hs.audiodevice.defaultInputDevice():jackConnected()
    x.transport = hs.audiodevice.defaultInputDevice():transportType()

    log.f("🎙🔴\n%s", hs.inspect(x))
end

function preFlightChat()
    hs.execute("open -F -n -b com.google.Chrome --args --disable-notifications --app=https://verstaerker-583.github.io/obs/gp/html/chat.html")
end

function preFlightCloseApps()
    for i, win in ipairs(hs.window.allWindows()) do
        bundle = win:application():bundleID()
        if bundle == "com.obsproject.obs-studio" then
        -- elseif bundle == "com.apple.Safari" then
        elseif bundle == "com.apple.Terminal" then
        elseif bundle == "com.boinx.FotoMagico5" then
        elseif bundle == "com.microsoft.Powerpoint" then
        elseif bundle == "com.teamviewer.TeamViewer" then
        elseif bundle == "org.hammerspoon.Hammerspoon" then
        else
	    win:close()
            win:application():kill9()
        end
    end
end

function preFlightScreens()
    for _, dev in ipairs(hs.screen.allScreens()) do
        dev:desktopImageURL("file:///System/Library/Desktop%20Pictures/Solid%20Colors/Black.png")
        dev:setBrightness(0.50)

        if dev:name() == "Color LCD" then
            dev:setPrimary()
        end

        if dev == hs.screen.primaryScreen() then
            if not dev:setMode(Mode01w, Mode01h, 2) then
                dev:setMode(Mode01w, Mode01h, 1)
            end
        else
            if not dev:setMode(Mode11w, Mode11h, 2) then
                dev:setMode(Mode11w, Mode11h, 1)
            end
        end

        local x = dev:currentMode()
        x.name = dev:name()
        x.position = dev:position()
        x.UUID = dev:getUUID()

        log.f("🖥️\n%s", hs.inspect(x))
    end
end

function preFlightSystem()
    hs.execute("defaults write com.apple.dock autohide -bool true")
    hs.execute("defaults write com.apple.finder CreateDesktop -bool false")
    hs.execute("killall 'Dock'")
    hs.execute("killall 'Finder'")
    hs.execute("killall 'System Preferences'")

    -- Wifi
    if hs.network.interfaceDetails(v4) then
        if hs.network.interfaceDetails(v4)["AirPort"] then
--            hs.alert("🚨 📶 🚨", 10)
            log.i("🚨 📶 🚨")
        end
    end

    -- Power
    if hs.battery.powerSource() ~= "AC Power" then
--        hs.alert("🚨 🔌 🚨", 10)
        log.i("🚨 🔌 🚨")
    end

    -- Power Management
    hs.caffeinate.set("system", true, false)
end

function preFlightWindows()
    for _, win in ipairs(hs.window.allWindows()) do
        bundle = win:application():bundleID()
        if bundle == "com.obsproject.obs-studio" and win:unminimize():isStandard() then
            win:setSize(0, 730)
            topCenter(win)
        elseif bundle == "com.boinx.FotoMagico5" and win:unminimize():isStandard() then
            win:setSize(0, 0)
            bottomRight(win)
        elseif bundle == "com.microsoft.Powerpoint" and win:unminimize():isStandard() then
            win:setSize(0, 0)
            win:maximize()
        elseif bundle == "com.google.Chrome" and win:unminimize():isStandard() then
            topLeftMaxY(win)
        else
            win:minimize()
        end
    end
end

function tweakFotoMagico()
    hs.execute("defaults com.boinx.FotoMagico5 FMThemeType")
    hs.execute("defaults delete com.boinx.FotoMagico5 masterVolume")
    hs.execute("defaults delete com.google.Chrome")
    -- hs.execute("defaults write com.boinx.FotoMagico5 FMThemeType -int 2")
    hs.execute("defaults write com.boinx.FotoMagico5 ScreenHasBeenChosen -int 1")
    hs.execute("defaults write com.boinx.FotoMagico5 defaultHeight -int 720")
    hs.execute("defaults write com.boinx.FotoMagico5 defaultWidth -int 1280")
    hs.execute("defaults write com.boinx.FotoMagico5 diagnosticsDidShowOptInAlert -bool true")
    hs.execute("defaults write com.boinx.FotoMagico5 didShowAutoSaveAlert -bool true")
    -- hs.execute("defaults write com.boinx.FotoMagico5 suspendBackgroundTasksDuringPlayback -int 1")
end

function tweakOSX()
    hs.execute("killall 'System Preferences'")
    hs.execute("defaults write com.apple.finder CreateDesktop -bool false")
    hs.execute("killall Finder")
end

function bottomRight(win)
    local f = win:frame()
    local max = win:screen():fullFrame()

    local x = f

    x.x = (max.w - f.w)
    x.y = (max.h - f.h)
    win:setFrame(x)
end

function topCenter(win)
    local f = win:frame()
    local max = win:screen():fullFrame()

    local x = f

    x.x = ((max.w - f.w) / 2) + max.x
    x.y = 0
    win:setFrame(x)
end

function topLeftMaxY(win)
    local f = win:frame()
    local max = win:screen():fullFrame()

    local x = f

    x.x = 0 
    x.y = 0
    x.w = 500
    x.h = max.h
    win:setFrame(x)
end

function reloadConfig(files)
    doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

function applicationWatcher(appName, eventType, appObject)
    if (appName == "OBS") then
        if (eventType == hs.application.watcher.launched) then
            if
                hs.application.applicationsForBundleID("com.boinx.FotoMagico5") or
                    hs.application.applicationsForBundleID("com.microsoft.Powerpoint")
             then
                preFlightAudio()
            end
        elseif (eventType == hs.application.watcher.terminated) then
            postFlight()
        end
    end
end

-- Hammerspoon Preferences
hs.application.enableSpotlightForNameSearches(true)
hs.autoLaunch(true)
hs.automaticallyCheckForUpdates(true)
hs.closeConsole()
hs.consoleOnTop(false)
hs.uploadCrashData(false)
hs.window.animationDuration = 0

-- Key Bindings
hyper = {"ctrl", "alt", "cmd"}
hs.hotkey.bind(hyper, "a", preFlightAudio)
hs.hotkey.bind(hyper, "c", preFlightChat)
hs.hotkey.bind(hyper, "s", preFlightScreens)
hs.hotkey.bind(hyper, "w", preFlightWindows)
hs.hotkey.bind(hyper, "l", Launch)

-- Watcher
myWatcher0 = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
myWatcher1 = hs.application.watcher.new(applicationWatcher):start()

-- tweak
if hs.application.pathForBundleID("com.boinx.FotoMagico5") then
    tweakFotoMagico()
end

log = hs.logger.new("Pre-Flight", "debug")
