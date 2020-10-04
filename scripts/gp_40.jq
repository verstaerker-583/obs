.name = "gp_40"

| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"gp40")

| (.sources[] | select(.name == "cams").filters[] | select(.id == "mask_filter").settings.image_path) |= sub("gp";"gp40")
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").bounds.x) = 352
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").pos.x) = 1094 

| del(.sources[] | select(.name == "cams").settings.items[] |select(.name == "External").rot)

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
