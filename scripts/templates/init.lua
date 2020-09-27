-- Alerts
hs.alert.defaultStyle.strokeColor = {red = 1, alpha = 1}
hs.alert.defaultStyle.strokeWidth = 10
hs.alert.defaultStyle.textColor = {red = 1, alpha = 1}
-- hs.alert.defaultStyle.textSize = 64

function applicationWatcher(appName, eventType, appObject)
	if appName == "OBS" then
		if eventType == hs.application.watcher.launching then
			preFlight(true)
		end
		if eventType == hs.application.watcher.terminated then
			postFlight()
		end
	end
end

function mailLogs()
	hs.execute(
		"system_profiler -json -detailLevel full SPAudioDataType SPCameraDataType SPDisplaysDataType SPHardwareDataType SPSoftwareDataType > /tmp/system.json"
	)
	local mailer = hs.sharing.newShare("com.apple.share.Mail.compose")
	mailer:subject("Logfiles " .. os.date()):recipients({"o.koepke@gmx.de"})
	mailer:shareItems(
		{
			hs.sharing.fileURL("/tmp/log.txt"),
			hs.sharing.fileURL("/tmp/system.json"),
			hs.sharing.fileURL("~/Library/Application Support/obs-studio/basic"),
			hs.sharing.fileURL("~/Library/Application Support/obs-studio/logs")
		}
	)
end

function postFlight()
	-- Video
	local devices = hs.screen.allScreens()
	for i, dev in ipairs(devices) do
		if dev ~= hs.screen.primaryScreen() then
			dev:setMode(1920, 1080, 1)					-- specific
		end
	end

	-- Alert Sounds
	hs.osascript._osascript("set volume alert volume 100", "")

	-- Audio
	devices = hs.audiodevice.allDevices()
	for i, dev in ipairs(devices) do
		dev:setMuted(false)
		if dev:transportType() == "Built-in" then
			dev:setDefaultOutputDevice()
			dev:setVolume(25)
		end
	end

	-- Power Management
	hs.caffeinate.set("displayIdle", false, false)

	-- Wifi
	hs.wifi.setPower(true)
	hs.notify.new({title = "OBS", informativeText = "Post-Flight Checklist completed!"}):send()
end

function preFlight()
	local muted = "false"

	local log = io.open("/tmp/log.txt", "w")
	log:write(os.date() .. "\n")

	-- Video
	local alarm = true
	log:write("\nScreens\n")

	devices = hs.screen.allScreens()
	log:write(hs.inspect(devices) .. "\n")

	for i, dev in ipairs(devices) do
		log:write("Screen: " .. dev:position() .. "\n")
		log:write("current: " .. hs.inspect(dev:currentMode()) .. "\n")
		if dev ~= hs.screen.primaryScreen() then
			dev:setMode(1280, 720, 1)
			alarm = false
		elseif dev:name() == "Color LCD" then					-- MacBook?
--			dev:setMode(1680, 1050, 1)					-- specific
		end
		log:write("done: " .. hs.inspect(dev:currentMode()) .. "\n")
--		log:write(hs.inspect(dev:availableModes()) .. "\n")			-- for new platforms
	end
	if alarm then
		hs.alert.show("Connect external MONITOR!")
		log:write("\nConnect external MONITOR!\n")
	end

	-- FotoMagico
	hs.execute("defaults delete com.boinx.FotoMagico5 'NSWindow Frame GetInfo'")
	hs.execute("defaults delete com.boinx.FotoMagico5 masterVolume")
	hs.execute("defaults delete com.boinx.FotoMagico5 FMThemeType")
--	hs.execute("defaults write com.boinx.FotoMagico5 FMThemeType -int 2")
	hs.execute("defaults write com.boinx.FotoMagico5 ScreenHasBeenChosen -int 1")
	hs.execute("defaults write com.boinx.FotoMagico5 defaultHeight -int 720")
	hs.execute("defaults write com.boinx.FotoMagico5 defaultWidth -int 1280")
	hs.execute("defaults write com.boinx.FotoMagico5 enableAutoSave -int 1")
	hs.execute("defaults write com.boinx.FotoMagico5 suspendBackgroundTasksDuringPlayback -int 1")

	-- Alert Sounds
	hs.osascript._osascript("set volume alert volume 0", "")

	-- Audio Input Devices
	log:write("\nAudio Input Devices\n")
	log:write("current: " .. hs.inspect(hs.audiodevice.current(true)) .. "\n")

	devices = hs.audiodevice.allInputDevices()
	log:write(hs.inspect(devices) .. "\n\n")
	for i, dev in ipairs(devices) do
		dev:setInputMuted(false)
		dev:setBalance(0.5)
		if dev:transportType() == "Built-in" then
			dev:setDefaultInputDevice()
			dev:setInputVolume(40)						 -- Micro
		elseif dev:transportType() == "Virtual" then
			dev:setInputVolume(40)						 -- NDI Audio
		else
			dev:setInputMuted(true)
		end
		if dev:inputMuted() then
			muted = "Muted"
		end
		log:write(dev:transportType() .. " " .. dev:name() .. " " .. dev:inputVolume() .. " " .. muted .. "\n")
	end
	log:write("\ndone: " .. hs.inspect(hs.audiodevice.current(true)) .. "\n")

	-- Mac(Book) Pro
	if hs.audiodevice.findDeviceByUID("BuiltInMicrophoneDevice") then
		if hs.audiodevice.findDeviceByUID("BuiltInHeadphoneInputDevice"):setDefaultInputDevice() then
			log:write("re-done: " .. hs.inspect(hs.audiodevice.current(true)) .. "")
		else
			hs.alert.show("Connect HEADSET!")
			log:write("\nConnect HEADSET!\n")
		end
	end

	-- Audio Output Devices
	log:write("\nAudio Output Devices\n")
	log:write("current: " .. hs.inspect(hs.audiodevice.current()) .. "\n")

	devices = hs.audiodevice.allOutputDevices()
	log:write(hs.inspect(devices) .. "\n")

	for i, dev in ipairs(devices) do
		dev:setMuted(false)
		dev:setBalance(0.5)
		if dev:transportType() == "Built-in" then
			dev:setVolume(50)
		elseif dev:transportType() == "Virtual" then
			dev:setDefaultOutputDevice()
			dev:setInputVolume(75)						 -- BlackHole
			dev:setVolume(100)
		else
			dev:setVolume(50)
			dev:setMuted(true)
		end

		if dev:inputVolume() then
			log:write(dev:transportType() .. " " .. dev:name() .. " " .. dev:volume() .. " >< " .. dev:inputVolume() .. "\n")
		else
			log:write(dev:transportType() .. " " .. dev:name() .. " " .. dev:volume() .. "\n")
		end
	end

	log:write("done: " .. hs.inspect(hs.audiodevice.current()) .. "\n")

	-- Power Management
	hs.caffeinate.set("displayIdle", true, false)

	-- Power
	if hs.battery.powerSource() ~= "AC Power" then
		hs.alert.show("Connect POWER!")
		log:write("\nConnect POWER!\n")
	end

	-- Network
	if hs.network.interfaceDetails(v4) then
		if hs.network.interfaceDetails(v4)["AirPort"] then
			hs.alert.show("Connect LAN!")
			log:write("\nConnect LAN!\n")
		else
			hs.wifi.setPower(false)
		end
	end

	-- Apps
	hs.application.open("NDI Virtual Input", 0, true)

	hs.notify.new({title = "OBS", informativeText = "Pre-Flight Checklist completed!"}):send()

	log:close()
end

function closeApps()
	for i, app in ipairs(hs.application.runningApplications()) do
		if app:name() == "Finder" then
		elseif app:name() == "AirPlayUIAgent" then
		elseif app:name() == "CleanMyMac X" then
		elseif app:name() == "Dock" then
		elseif app:name() == "FotoMagico 5" then
		elseif app:name() == "Hammerspoon" then
		elseif app:name() == "NDI Virtual Input" then
		elseif app:name() == "Nachrichten" then
		elseif app:name() == "Notizen" then
		elseif app:name() == "OBS" then
			preFlight()
		elseif app:name() == "Safari" then
		elseif app:name() == "Skype" then
		elseif app:name() == "Terminal" then
		else
			app:kill()
		end
	end
end

function startStreaming()
	closeApps()

	hs.execute("open -a 'OBS' --args --collection 'gp_naked' --profile 'YTsq' --scene 'Start' --startstreaming --verbose")
	hs.application.open("Skype", 0, true)
	hs.application.launchOrFocus("FotoMagico 5")
end

-- Watcher/ Key Bindings
appWatcher = hs.application.watcher.new(applicationWatcher):start()
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "G", preFlight)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", mailLogs)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "S", startStreaming)

-- Configuration reloading
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
