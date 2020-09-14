.name = "bd_solo"

| (.sources[] | select(.id == "browser_source").settings.url) |= gsub("html";"svg")
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("cam";"bubbles")
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"bd")

| (.sources[] | select(.name == "?").settings.color1) = 4284888012
| (.sources[] | select(.name == "?").settings.color2) = 4294967295
| (.sources[] | select(.id == "color_source").settings.color) = 4288269363

| del(.. |
	select(.name? == "Overlay Chat"),
	select(.name? == "Overlay Donate")
)

| del(.sources[].hotkeys[
		"libobs.hide_scene_item.Overlay Chat",
		"libobs.hide_scene_item.Overlay Donate",
		"libobs.show_scene_item.Overlay Chat",
		"libobs.show_scene_item.Overlay Donate"
	]
)
