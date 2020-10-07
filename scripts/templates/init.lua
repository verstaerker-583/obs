streamingLayout = {
	{"OBS", nil, "Color LCD", nil, hs.geometry.rect(40, 0, 950, 750), nil},
	{"FotoMagico 5", nil, "Color LCD", nil, hs.geometry.rect(-990, -622, 950, 0), nil},
	{"Skype", nil, "Color LCD", nil, hs.geometry.rect(-660, 0, 0, 0), nil}
}

function applicationWatcher(appName, eventType, appObject)
	if appName == "OBS" then
		if eventType == hs.application.watcher.launched then
			preFlight()
		end
		if eventType == hs.application.watcher.terminated then
			postFlight()
		end
	end
end

function closeApps()
	for i, app in ipairs(hs.application.runningApplications()) do
		if app:name() == "Finder" then
		elseif app:name() == "AirPlayUIAgent" then
--		elseif app:name() == "Dock" then
		elseif app:name() == "FotoMagico 5" then
		elseif app:name() == "Hammerspoon" then
		elseif app:name() == "NDI Virtual Input" then
		elseif app:name() == "OBS" then
			preFlight()
		elseif app:name() == "Skype" then
		else
			app:kill()
		end
	end
end

function mailLogs()
	hs.execute(
		"system_profiler -json -detailLevel full SPAudioDataType SPCameraDataType SPDisplaysDataType SPHardwareDataType SPNetworkDataType SPSoftwareDataType\
		> ~/Library/Application Support/obs-studio/logs/system.json"
	)
	local mailer = hs.sharing.newShare("com.apple.share.Mail.compose")
	mailer:subject("Logfiles " .. os.date()):recipients({"o.koepke@gmx.de"})
	mailer:shareItems(
		{
			hs.sharing.fileURL("/tmp/log.txt"),
			hs.sharing.fileURL("~/Library/Application Support/obs-studio/logs/system.json"),
			hs.sharing.fileURL("~/Library/Application Support/obs-studio/basic"),

			hs.sharing.fileURL("~/Library/Application Support/obs-studio/logs")
		}
	)
end

function postFlight()
	-- Video
	local devices = hs.screen.allScreens()
	for i, dev in ipairs(devices) do
		dev:desktopImageURL("file:///System/Library/CoreServices/DefaultDesktop.heic")
		if dev ~= hs.screen.primaryScreen() then
			dev:setMode(1920, 1080, 1)					-- specific
		elseif dev:name() == "Color LCD" then					-- MacBook?
			dev:setMode(1440, 900, 1)					-- specific
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
	-- Dock
	tweakDock()

	-- FotoMagico
	tweakFotoMagico()

	local headset = false
	local monitor = false

	local log = io.open("/tmp/log.txt", "w")
	log:write(os.date() .. "\n")

	-- Video
	log:write("🖥️ Screens\n")

	devices = hs.screen.allScreens()
	log:write(hs.inspect(devices) .. "\n")

	for i, dev in ipairs(devices) do
		dev:desktopImageURL("file:///System/Library/Desktop%20Pictures/Solid%20Colors/Black.png")
		log:write("🖥️ Screen: " .. dev:position() .. "\n")
		log:write("current: " .. hs.inspect(dev:currentMode()) .. "\n")
--		dev:setBrightness(0.50)
		if dev ~= hs.screen.primaryScreen() then
--			monitor = dev:setMode(1280, 720, 1)
		elseif dev:name() == "Color LCD" then					-- MacBook?
--			dev:setMode(1920, 1200, 1)					-- specific
		end
		log:write("done: " .. hs.inspect(dev:currentMode()) .. "\n")
--		log:write(hs.inspect(dev:availableModes()) .. "\n")			-- for new platforms
	end
	if not monitor then
--		hs.alert.show("🚨 🖥️ 🚨", 10)
		log:write("🚨 🖥️ 🚨\n")
	end

	-- Alert Sounds
	hs.osascript._osascript("set volume alert volume 0", "")

	-- Audio Input Devices
	log:write("🎤 Audio Input Devices\n")
	log:write("current: " .. hs.inspect(hs.audiodevice.current(true)) .. "\n")

	devices = hs.audiodevice.allInputDevices()
	log:write(hs.inspect(devices) .. "\n")
	for i, dev in ipairs(devices) do
		dev:setInputMuted(false)
		dev:setBalance(0.5)
		if dev:jackConnected() then
			headset = true
			log:write("👍 🎧 👌\n")
		end
		if dev:transportType() == "Built-in" then				-- Micro
--			dev:setDefaultInputDevice()
			dev:setInputVolume(40)
		elseif dev:transportType() == "USB" then				-- USB 
			dev:setDefaultInputDevice()
			dev:setInputVolume(75)
		elseif dev:transportType() == "Virtual" then				-- NDI Audio
			dev:setInputVolume(40)
		else
			dev:setInputMuted(true)
		end
		log:write(dev:transportType() .. " " .. dev:name() .. " " .. dev:inputVolume() .. "\n")
	end
	log:write("done: " .. hs.inspect(hs.audiodevice.current(true)) .. "\n")

	-- Mac(Book) Pro
	if hs.audiodevice.findDeviceByUID("BuiltInHeadphoneInputDevice") then
		headset = true
		if hs.audiodevice.findDeviceByUID("BuiltInHeadphoneInputDevice"):setDefaultInputDevice() then
			log:write("re-done: " .. hs.inspect(hs.audiodevice.current(true)) .. "\n")
		end
	end
	if not headset then
		hs.alert.show("🚨 🎧 🚨", 10)
		log:write("🚨 🎧 🚨\n")
	end

	-- Audio Output Devices
	log:write("🎧 Audio Output Devices\n")
	log:write("current: " .. hs.inspect(hs.audiodevice.current()) .. "\n")

	devices = hs.audiodevice.allOutputDevices()
	log:write(hs.inspect(devices) .. "\n")

	for i, dev in ipairs(devices) do
		dev:setMuted(false)
		dev:setBalance(0.5)
		if dev:transportType() == "Built-in" then
			if headset then
				dev:setVolume(75)
			else
				dev:setVolume(25)
			end
		elseif dev:transportType() == "Virtual" then
--			dev:setDefaultOutputDevice()
			dev:setInputVolume(75)						-- BlackHole
			dev:setVolume(100)
		else
			dev:setVolume(50)
			dev:setMuted(true)
		end

		if dev:inputVolume() then
			log:write(
				dev:transportType() .. " " .. dev:name() .. " " .. dev:volume() .. " 🎤 " .. dev:inputVolume() .. "\n"
			)
		else
			log:write(dev:transportType() .. " " .. dev:name() .. " " .. dev:volume() .. "\n")
		end
	end

	log:write("done: " .. hs.inspect(hs.audiodevice.current()) .. "\n")

	-- Power Management
	hs.caffeinate.set("displayIdle", true, false)

	-- Power
	if hs.battery.powerSource() ~= "AC Power" then
		hs.alert.show("🚨 🔌 🚨", 10)
		log:write("🚨 🔌 🚨\n")
	end

	-- Network
	if hs.network.interfaceDetails(v4) then
		if hs.network.interfaceDetails(v4)["AirPort"] then
			hs.alert.show("🚨 📶 🚨", 10)
			log:write("🚨 📶 🚨\n")
		else
			hs.wifi.setPower(false)
		end
	end

	-- Apps
--	hs.application.open("NDI Virtual Input", 0, true)

	hs.notify.new({title = "OBS", informativeText = "Pre-Flight Checklist completed!"}):send()

	log:close()
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

function startStreaming()
	closeApps()

	hs.execute("open -a 'OBS' --args --collection 'gp_naked' --profile 'YTsq' --scene 'Start' --startstreaming --verbose")
	hs.application.open("Skype", 0, true)
	hs.application.launchOrFocus("FotoMagico 5")
end

function streamLayout()
	for i, window in ipairs(hs.window.allWindows()) do
		window:unminimize()
	end
	hs.layout.apply(streamingLayout)
end

function tweakDock()
--	hs.execute("defaults delete com.apple.Dock")
	hs.execute("defaults write com.apple.Dock autohide -int 1")
	hs.execute("defaults write com.apple.Dock showhidden -bool yes")
--	hs.execute("defaults write com.apple.dock static-only -bool true")
end

function tweakFotoMagico()
--	hs.execute("defaults delete com.boinx.FotoMagico5 'NSWindow Frame GetInfo'")
	hs.execute("defaults delete com.boinx.FotoMagico5 masterVolume")
	hs.execute("defaults delete com.boinx.FotoMagico5 FMThemeType")
	hs.execute("defaults write com.boinx.FotoMagico5 ScreenHasBeenChosen -int 1")
	hs.execute("defaults write com.boinx.FotoMagico5 defaultHeight -int 720")
	hs.execute("defaults write com.boinx.FotoMagico5 defaultWidth -int 1280")
	hs.execute("defaults write com.boinx.FotoMagico5 enableAutoSave -int 1")
	hs.execute("defaults write com.boinx.FotoMagico5 suspendBackgroundTasksDuringPlayback -int 0")
end

-- Watcher
mywatcher0 = hs.application.watcher.new(applicationWatcher):start()
mywatcher1 = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

-- Key Bindings
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "G", preFlight)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", mailLogs)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "S", startStreaming)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", streamLayout)

local address = hs.execute("curl ipecho.net/plain; echo")
--hs.messages.iMessage("o.koepke@gmx.de", address)
