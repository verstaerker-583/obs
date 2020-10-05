.name = "bd_solo"

| (.sources[] | select(.id == "browser_source").settings.url) |= gsub("html";"svg")
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("cam";"bubbles")
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"bd")

| (.sources[] | select(.id == "color_source").settings.color) = 4288269363
| (.sources[] | select(.name == "?").settings.color1) = 4284888012
| (.sources[] | select(.name == "?").settings.color2) = 4294967295

| del(.. |
	select(
		.key? == "OBS_KEY_F",
		.key? == "OBS_KEY_H",
		.name? == "Overlay Chat",
		.name? == "Overlay Donate"
	)
)

| del(.sources[].hotkeys[
		"libobs.hide_scene_item.Overlay Chat",
		"libobs.hide_scene_item.Overlay Donate",
		"libobs.show_scene_item.Overlay Chat",
		"libobs.show_scene_item.Overlay Donate"
	]
)

| del(.sources[] | select(.name != "guest").settings.items[]? | select(.name == "NDI"))
| del(.sources[] | select(.name != "guest").hotkeys[
		"libobs.hide_scene_item.NDI",
		"libobs.show_scene_item.NDI"
	]
)
