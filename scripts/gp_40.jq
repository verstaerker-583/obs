.name = "gp_40"

| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"gp40")


| del(.DesktopAudioDevice1)

| del(.. |
	.mixers?,
	select(.enabled? == "false"),
	select(.name? == "Background"),
	select(.name? == "Screen Capture")
)

| del(.sources[].hotkeys[
		"libobs.show_scene_item.Background",
		"libobs.show_scene_item.Screen Capture"
	]
)
