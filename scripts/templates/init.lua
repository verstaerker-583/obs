Skype = false
FotoMagico = false

streamingLayout = {
	{"OBS", nil, "Color LCD", nil, hs.geometry.rect(292, 97, 0, 705), nil},
	{"Skype", nil, "Color LCD", nil, hs.geometry.rect(-0, 120, 0, 0), nil}
}

streamingLayoutFM = {
	{"FotoMagico 5", nil, "Color LCD", nil, hs.geometry.rect(-990, -622, 950, 0), nil},
	{"OBS", nil, "Color LCD", nil, hs.geometry.rect(40, 0, 950, 750), nil},
	{"Skype", nil, "Color LCD", nil, hs.geometry.rect(-660, 0, 0, 0), nil}
}

function appsClose()
	for i, app in ipairs(hs.application.runningApplications()) do
		if app:name() == "OBS" then
		elseif app:name() == "AirPlayUIAgent" then
		elseif app:name() == "FotoMagico 5" then
		elseif app:name() == "Hammerspoon" then
		elseif app:name() == "Microsoft PowerPoint" and not FotoMagico then
		elseif app:name() == "NDI Virtual Input" and Skype then
		elseif app:name() == "Skype" and Skype then
		elseif app:name() == "TeamViewer" then
		elseif app:name() == "Terminal" then
		else
			app:kill()
		end
	end
end

function appsStart()
	hs.execute(
		"open -a 'OBS' --args --collection 'gp_naked' --disable-updater --profile 'gpYTmq' --startstreaming --startvirtualcam --unfiltered_log --verbose"
	)
	if Skype then
		hs.application.open("NDI Virtual Input", 0, true)
		hs.application.open("Skype", 0, true)
	end
end

function applicationWatcher(appName, eventType, appObject)
	if (eventType == hs.application.watcher.launched) then
		if (appName == "OBS") then
			preFlight()
		end
	end
	if (eventType == hs.application.watcher.terminated) then
		if (appName == "OBS") then
			postFlight()
		end
	end
end

function Layout()
	if FotoMagico then
		hs.layout.apply(streamingLayoutFM)
	else
		hs.layout.apply(streamingLayout)
	end
	for i, window in ipairs(hs.window.allWindows()) do
		window:unminimize()
	end
end

function postFlight()
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

	-- Wifi
	hs.wifi.setPower(true)

	-- Video
	local devices = hs.screen.allScreens()
	for i, dev in ipairs(devices) do
		dev:desktopImageURL("file:///System/Library/CoreServices/DefaultDesktop.heic")
		if dev ~= hs.screen.primaryScreen() then
			dev:setMode(1920, 1080, 1)
		elseif dev:name() == "Color LCD" then
			dev:setMode(1440, 900, 1)
		end
	end
end

function preFlight()
	preFlightSystem()
	preFlightAudio()
end

function preFlightAudio()
	local headset = false
	local usbmic = false

	hs.osascript("set volume alert volume 0")

	-- Audio Input Devices
	devices = hs.audiodevice.allInputDevices()
	for i, dev in ipairs(devices) do
		dev:setBalance(0.5)
		dev:setInputMuted(false)
		if dev:transportType() == "Built-in" then						-- Mic
			if dev:jackConnected() or dev:uid() == "BuiltInHeadphoneInputDevice" then
				dev:setDefaultInputDevice()
				dev:setInputVolume(25)
				headset = true
			elseif not headset and not usbmic then
				dev:setDefaultInputDevice()
				dev:setInputVolume(25)
			end
		elseif dev:transportType() == "USB" and not headset then
			dev:setDefaultInputDevice()
			dev:setInputVolume(75)
			usbmic = true
		elseif dev:transportType() == "Virtual" then						 -- NDI
			dev:setInputVolume(45)
		else
			dev:setInputMuted(true)
		end

		if dev:outputVolume() then
			log.f('In-/Output Device "%s"\n\t"%s"\t(%s) %.0f/%.0f (%s)', dev:name(), dev:uid(), dev:transportType(), dev:inputVolume(), dev:outputVolume(), dev:muted())
		else
			log.f('Input Device "%s"\n\t"%s"\t(%s) %.0f (%s)', dev:name(), dev:uid(), dev:transportType(), dev:inputVolume(), dev:muted())
		end
	end
	log.f('Default Input Device\n%s', hs.inspect(hs.audiodevice.current(true)))

	-- Audio Output Devices
	devices = hs.audiodevice.allOutputDevices()
	for i, dev in ipairs(devices) do
		dev:setBalance(0.5)
		dev:setMuted(false)

		if dev:transportType() == "Built-in" then
			if headset then
				dev:setOutputVolume(100)
			else
				dev:setOutputVolume(25)
			end
		elseif dev:transportType() == "USB" and not headset then
			dev:setOutputVolume(50)
		elseif dev:transportType() == "Virtual" then						 -- BlackHole
			dev:setDefaultOutputDevice()
			dev:setInputVolume(75)
			dev:setOutputVolume(100)
		else
			dev:setMuted(true)
		end

		if dev:inputVolume() then
			log.f('In-/Output Device "%s"\n\t"%s"\t(%s) %.0f/%.0f (%s)', dev:name(), dev:uid(), dev:transportType(), dev:inputVolume(), dev:outputVolume(), dev:muted())
		else
			log.f('Input Device "%s"\n\t"%s"\t(%s) %.0f (%s)', dev:name(), dev:uid(), dev:transportType(), dev:outputVolume(), dev:muted())
		end
	end
	log.f('Default Output Device\n%s', hs.inspect(hs.audiodevice.current(false)))

	if not headset then
		hs.alert.show("🚨 🎧 🚨", 10)
		log.i("🚨 🎧 🚨")
		if not usbmic then
			hs.alert.show("🚨 🎙 🚨", 10)
			log.i("🚨 🎙 🚨")
		end
	end
end

function preFlightFull()
	tweakOSX()
	appsClose()
	preFlightVideo()
	appsStart()
end

function preFlightSystem()
	-- Power
	if hs.battery.powerSource() ~= "AC Power" then
		hs.alert("🚨 🔌 🚨", 10)
		log.i("🚨 🔌 🚨")
	end

	-- Power Management
	hs.caffeinate.set("system", true, false)

	-- Wifi
	if hs.network.interfaceDetails(v4) then
		if hs.network.interfaceDetails(v4)["AirPort"] then
			hs.alert("🚨 📶 🚨", 10)
			log.i("🚨 📶 🚨")
		else
			hs.wifi.setPower(false)
		end
	end
end

function preFlightVideo()
	local monitor = false
	devices = hs.screen.allScreens()
	for i, dev in ipairs(devices) do
		dev:desktopImageURL("file:///System/Library/Desktop%20Pictures/Solid%20Colors/Black.png")
		if dev:name() == "Color LCD" then
			if FotoMagico then
				dev:setMode(1920, 1200, 1)
			else
				dev:setMode(1440, 900, 1)
			end
		elseif dev ~= hs.screen.primaryScreen() then
			monitor = dev:setMode(1280, 720, 1)
		end
		log.f('🖥️ "%s" %s\n%s', dev:name(), dev:position(), hs.inspect(dev:currentMode()))
	end
	if not monitor then
		hs.alert.show("🚨 🖥️ 🚨", 10)
		log.i("🚨 🖥️ 🚨")
	end
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

function tweakOSX()
--	hs.execute("defaults delete com.apple.Dock")
	hs.execute("defaults write com.apple.Dock autohide -bool true")
	hs.execute("defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1")
--	hs.execute("defaults write com.apple.dashboard mcx-disabled -bool  true")
--	hs.execute("defaults write com.apple.dock ResetLaunchPad -bool true")
--	hs.execute("defaults write com.apple.dock single-app -bool true")
--	hs.execute("defaults write com.apple.dock static-only -bool true")
end

log = hs.logger.new("Pre-Flight","debug")

if FotoMagico then
	teakFotoMagico()
end

-- Hammerspoon Preferences
hs.autoLaunch(true)
hs.automaticallyCheckForUpdates(true)
-- hs.closeConsole()
hs.consoleOnTop(false)

-- Watcher
myWatcher0 = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
myWatcher1 = hs.application.watcher.new(applicationWatcher):start()

-- Key Bindings
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "a", preFlightAudio)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "f", preFlightFull)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "v", preFlightVideo)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "w", Layout)

-- URL Bindings
hs.urlevent.bind("Audio", preFlightAudio)
hs.urlevent.bind("Full", preFlightFull)
hs.urlevent.bind("Video", preFlightVideo)
hs.urlevent.bind("Layout", Layout)

hs.alert("Config loaded")
