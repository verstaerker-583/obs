function applicationWatcher(appName, eventType, appObject)
	if appName == "OBS" then
		if eventType == hs.application.watcher.launching then
			preFlight()
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
	-- Audio
	hs.osascript._osascript("set volume alert volume 100", "")

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
			if dev:setMode(3840, 2160, 1) then
			else
				dev:setMode(1920, 1080, 1)
			end
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

	-- Various
	hs.execute("defaults delete com.boinx.FotoMagico5 masterVolume")
	hs.execute("defaults write com.boinx.FotoMagico5 ScreenHasBeenChosen -int 1")

	-- Audio
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
			dev:setInputVolume(50)
		elseif dev:transportType() == "Virtual" then
			dev:setInputVolume(50) -- NDI Audio
		else
			dev:setInputMuted(true)
		end
		log:write(dev:transportType() .. " " .. dev:name() .. " " .. dev:volume() .. "\n")
	end

	log:write("done: " .. hs.inspect(hs.audiodevice.current(true)) .. "\n")

	if hs.audiodevice.findDeviceByName("Externes Mikrofon") then
		hs.audiodevice.findDeviceByName("Externes Mikrofon"):setDefaultInputDevice()
		log:write("re-done: " .. hs.inspect(hs.audiodevice.current(true)) .. "")
	else
		hs.notify.new({title = "OBS", informativeText = "No Headset!"}):send()
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
			dev:setInputVolume(75) -- BlackHole
			dev:setVolume(100)
		else
			dev:setVolume(50)
			dev:setMuted(true)
		end
		log:write(dev:transportType() .. " " .. dev:name() .. " " .. dev:volume() .. "\n")
	end

	log:write("done: " .. hs.inspect(hs.audiodevice.current()) .. "\n")

	-- Video
	log:write("\nScreens\n")
	devices = hs.screen.allScreens()
	log:write(hs.inspect(devices) .. "\n")
	for i, dev in ipairs(devices) do
		log:write("Screen: " .. dev:position() .. "\n")
		log:write("current: " .. hs.inspect(dev:currentMode()) .. "\n")
		if dev ~= hs.screen.primaryScreen() then
			dev:setMode(1280, 720, 1)
		end
		log:write("done: " .. hs.inspect(dev:currentMode()) .. "\n")
		log:write(hs.inspect(dev:availableModes()) .. "\n")
	end

	log:close()

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
		elseif app:name() == "Terminal" then
		else
			app:kill()
		end
	end

	hs.application.open("FotoMagico 5", 0, true)
	hs.application.open("NDI Virtual Input", 0, true)
	hs.application.open("Skype", 0, true)

--	hs.application.launchOrFocus("OBS")

	-- Power Management
	hs.caffeinate.set("displayIdle", true, false)

	hs.notify.new({title = "OBS", informativeText = "Pre-Flight Checklist completed!"}):send()

	-- Wifi
	-- hs.wifi.setPower(false)

	if hs.network.interfaceDetails(v4) then
		if hs.network.interfaceDetails(v4)["AirPort"] then
			print("on wifi")
		else
			print("on Lan")
		end
	else
		print("not connected to internet")
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

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "G", preFlight)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", mailLogs)
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
