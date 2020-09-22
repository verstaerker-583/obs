function Settings()
	local table = hs.screen.allScreens()
	hs.messages.iMessage("olafkoepke@icloud.com", hs.inspect(table))
	local table = hs.audiodevice.allDevices()
	hs.messages.iMessage("olafkoepke@icloud.com", hs.inspect(table))

	os.execute("defaults write com.boinx.FotoMagico5 masterVolume -float 0.25")
	os.execute("defaults write com.boinx.FotoMagico5 ScreenHasBeenChosen -int 1")



	hs.osascript._osascript("set volume alert volume 0", "")

	hs.audiodevice.findDeviceByName("BlackHole 16ch"):setDefaultOutputDevice()
	hs.audiodevice.findDeviceByName("BlackHole 16ch"):setInputMuted(false)
	hs.audiodevice.findDeviceByName("BlackHole 16ch"):setInputVolume(100)
	hs.audiodevice.findDeviceByName("BlackHole 16ch"):setMuted(false)
	hs.audiodevice.findDeviceByName("BlackHole 16ch"):setOutputVolume(100)
	hs.audiodevice.findDeviceByName("NDI Audio"):setVolume(50)

	if (hs.audiodevice.findDeviceByName("Built-in Microphone")) then
		hs.audiodevice.findDeviceByName("Built-in Microphone"):setDefaultInputDevice()
		hs.audiodevice.findDeviceByName("Built-in Microphone"):setMuted(false)
		hs.audiodevice.findDeviceByName("Built-in Microphone"):setVolume(50)
	end
	if (hs.audiodevice.findDeviceByName("MacBook Pro Mikrofon")) then
		hs.audiodevice.findDeviceByName("MacBook Pro Mikrofon"):setDefaultInputDevice()
		hs.audiodevice.findDeviceByName("MacBook Pro Mikrofon"):setMuted(false)
		hs.audiodevice.findDeviceByName("MacBook Pro Mikrofon"):setVolume(50)
	end
	if (hs.audiodevice.findDeviceByName("Built-in Output")) then
		hs.audiodevice.findDeviceByName("Built-in Output"):setMuted(false)
		hs.audiodevice.findDeviceByName("Built-in Output"):setVolume(50)
	end
	if (hs.audiodevice.findDeviceByName("MacBook Pro Lautsprecher")) then
		hs.audiodevice.findDeviceByName("MacBook Pro Lautsprecher"):setMuted(false)
		hs.audiodevice.findDeviceByName("MacBook Pro Lautsprecher"):setVolume(50)
	end


---	hs.screen "0,0":setBrightness(0.75)
	if (hs.screen "1,0") then
---		hs.screen "1,0":setBrightness(0.75)
		hs.screen "1,0":setMode(1280, 720, 1)
	end

	hs.application.open("NDI Virtual Input", 0, true)
	hs.application.open("Skype", 0, true)
	hs.application.open("FotoMagico 5", 0, true)

	hs.notify.new({title="OBS", informativeText="Checklist completed!"}):send()
end

function Landing()
	hs.audiodevice.findDeviceByName("Built-in Output"):setDefaultOutputDevice()
	hs.osascript._osascript("set volume alert volume 100", "")

	if (hs.screen "1,0") then
		hs.screen "1,0":setMode(1920, 1080, 1)
	end
end

function applicationWatcher(appName, eventType, appObject)
	if (eventType == hs.application.watcher.launched) then
		if (appName == "OBS") then
			Settings()
		end
	end
	if (eventType == hs.application.watcher.terminated) then
		if (appName == "OBS") then
			Landing()
		end
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

hs.application.watcher.new(applicationWatcher):start()
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", Settings)
