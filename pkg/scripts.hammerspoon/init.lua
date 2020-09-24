-- Alerts
hs.alert.defaultStyle.strokeColor = {red = 1, alpha = 1}
hs.alert.defaultStyle.strokeWidth = 10
hs.alert.defaultStyle.textColor = {red = 1, alpha = 1}
hs.alert.defaultStyle.textSize = 64

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
	mailer = hs.sharing.newShare("com.apple.share.Mail.compose")
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
	-- Alert Sounds
	hs.osascript._osascript("set volume alert volume 100", "")

	-- Audio
	devices = hs.audiodevice.allDevices()
	for i, dev in ipairs(devices) do
		dev:setMuted(false)
		if dev:transportType() == "Built-in" then
			dev:setDefaultOutputDevice()
		end
	end

	-- Video
	devices = hs.screen.allScreens()
	for i, dev in ipairs(devices) do
		if dev ~= hs.screen.primaryScreen() then
			dev:setMode(1920, 1080, 1)					-- specific
		end
	end

	-- Power Management
	hs.caffeinate.set("displayIdle", false, false)

	-- Wifi
	hs.wifi.setPower(true)
	hs.notify.new({title = "OBS", informativeText = "Post-Flight Checklist completed!"}):send()
end

function preFlight()
	log = io.open("/tmp/log.txt", "w")
	log:write(os.date() .. "\n")

	-- FotoMagico
	hs.execute("defaults delete com.boinx.FotoMagico5 masterVolume")
	hs.execute("defaults write com.boinx.FotoMagico5 ScreenHasBeenChosen -int 1")

	-- Alert Sounds
	hs.osascript._osascript("set volume alert volume 0", "")

	-- Audio Input Devices
	log:write("\nAudio Input Devices\n")
	log:write("current: " .. hs.inspect(hs.audiodevice.current(true)) .. "\n")
	devices = hs.audiodevice.allInputDevices()
	log:write(hs.inspect(devices) .. "\n")
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
		log:write(dev:transportType() .. " " .. dev:name() .. " " .. dev:volume() .. "\n")
	end
	log:write("done: " .. hs.inspect(hs.audiodevice.current(true)) .. "\n")

	-- Mac(Book) Pro
	if hs.audiodevice.findDeviceByUID("BuiltInMicrophoneDevice") then
		if hs.audiodevice.findDeviceByUID("BuiltInHeadphoneInputDevice"):setDefaultInputDevice() then
			log:write("re-done: " .. hs.inspect(hs.audiodevice.current(true)) .. "")
		else
			hs.alert.show("Connect HEADSET!", 20)
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
			dev:setInputMuted(false)
			dev:setInputVolume(75)						 -- BlackHole
			dev:setVolume(100)
		else
			dev:setVolume(50)
			dev:setMuted(true)
		end
		log:write(dev:transportType() .. " " .. dev:name() .. " " .. dev:volume() .. "\n")
	end
	log:write("done: " .. hs.inspect(hs.audiodevice.current()) .. "\n")

	-- Video
	alarm = true
	log:write("\nScreens\n")
	devices = hs.screen.allScreens()
	log:write(hs.inspect(devices) .. "\n")
	for i, dev in ipairs(devices) do
		log:write("Screen: " .. dev:position() .. "\n")
		log:write("current: " .. hs.inspect(dev:currentMode()) .. "\n")
		if dev ~= hs.screen.primaryScreen() then
			dev:setMode(1280, 720, 1)
			alarm = false
		elseif dev:name() == "Color LCD" then	-- MacBook?
			dev:setMode(1440, 900, 1)					-- specific
		end
		log:write("done: " .. hs.inspect(dev:currentMode()) .. "\n")
--		log:write(hs.inspect(dev:availableModes()) .. "\n")			-- for new platforms
	end
	if alarm then
		hs.alert.show("Connect external MONITOR!", 20)
		log:write("\nConnect external MONITOR!\n")
	end

	-- Power Management
	hs.caffeinate.set("displayIdle", true, false)

	-- Power
	if hs.battery.powerSource() ~= "AC Power" then
		hs.alert.show("Connect POWER!", 20)
		log:write("\nConnect POWER!\n")
	end


	-- Network
	if hs.network.interfaceDetails(v4) then
		if hs.network.interfaceDetails(v4)["AirPort"] then
			hs.alert.show("Connect LAN!", 20)
			log:write("\nConnect LAN!\n")
		else
			hs.wifi.setPower(false)
		end
	else
		hs.alert.show("Can not reach YouTube!", 20)
		log:write("\nCan not reach YouTube!\n")
	end
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

function startOBS()
	hs.execute("open -a 'OBS' --args --scene 'Start' --collection 'gp' --profile 'okYTsq' --verbose --startstreaming")

	-- Apps
	for i, app in ipairs(hs.application.runningApplications()) do
		if app:name() == "Finder" then
		elseif app:name() == "Dock" then
		elseif app:name() == "FotoMagico 5" then
		elseif app:name() == "Hammerspoon" then
		elseif app:name() == "Mitteilungszentrale" then
		elseif app:name() == "NDI Virtual Input" then
		elseif app:name() == "Nachrichten" then
		elseif app:name() == "Notizen" then
		elseif app:name() == "OBS" then
		elseif app:name() == "Skype" then
		else
			app:kill()
		end
	end
	hs.application.open("FotoMagico 5", 0, true)
	hs.application.open("NDI Virtual Input", 0, true)
	hs.application.open("Skype", 0, true)
end

-- Watcher/ Key Bindings
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "G", preFlight)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", mailLogs)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "O", startOBS)
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
