.name = "bd"

| (.sources[] | select(.id == "browser_source").settings.url) |= gsub("html";"svg")
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"bd")

| (.sources[] | select(.name == "?").settings.color1) = 4284888012
| (.sources[] | select(.name == "?").settings.color2) = 4294967295
| (.sources[] | select(.id == "color_source").settings.color) = 4288269363

| del(.. |
	select(.name? == "Background"),
	select(.name? == "Overlay Chat"),
	select(.name? == "Overlay Donate"),
	select(.name? == "screen")
)

| del(.sources[].hotkeys[
		"libobs.hide_scene_item.Overlay Chat",
		"libobs.hide_scene_item.Overlay Donate",
		"libobs.hide_scene_item.screen",
		"libobs.show_scene_item.Background",
		"libobs.show_scene_item.Overlay Chat",
		"libobs.show_scene_item.Overlay Donate",
		"libobs.show_scene_item.screen"
	]
)

| del(.sources[] | select(.id == "scene").filters)

| (.sources[] | select(.id == "scene").settings.items[] | select(.name == "External").pos.y) = 396
| (.sources[] | select(.id == "scene").settings.items[] | select(.name == "External").rot) = 5
| (.sources[] | select(.id == "scene").settings.items[] | select(.name == "Internal").pos.y) = 396
| (.sources[] | select(.id == "scene").settings.items[] | select(.name == "Internal").rot) = 5
| (.sources[] | select(.id == "scene").settings.items[] | select(.name == "NDI").pos.y) = 324
| (.sources[] | select(.id == "scene").settings.items[] | select(.name == "NDI").rot) = -5
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "?").pos.x) = 640
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "?").pos.y) = 360
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "External").bounds.x) = 600
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "External").bounds.y) = 600
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "External").bounds_type) = 3
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "External").pos.x) = 320
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "Internal").bounds.x) = 600
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "Internal").bounds.y) = 600
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "Internal").bounds_type) = 3
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "Internal").pos.x) = 320
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "NDI").bounds.x) = 600
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "NDI").bounds.y) = 600
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "NDI").pos.x) = 960
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").pos.x) = 128
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "Internal").pos.x) = 128

