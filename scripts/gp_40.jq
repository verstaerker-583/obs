.name = "gp_40"

| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"gp40")
| (.sources[] | select(.name == "cams").filters[] | select(.id == "mask_filter").settings.image_path) |= sub("gp";"gp40")


| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").bounds.x) = 352
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").pos.x) = 1094 
#| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External", .name == "Internal").bounds.x) = 352
#| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External", .name == "Internal").bounds.x) = 198
#| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External", .name == "Internal").pos.x) = 186 
#| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External", .name == "Internal").pos.y) = 400

| del(.sources[].hotkeys["libobs.show_scene_item.Internal"][]? |
	select(.key == "OBS_KEY_2"),
	select(.key == "OBS_KEY_3")
)

| del(.sources[] | select(.name == "cams").settings.items[] |
	select(.name == "External").rot,
	select(.name == "Internal").rot
)

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
