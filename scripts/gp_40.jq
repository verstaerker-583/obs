.name = "gp_40"

| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"gp40")

| (.sources[] | select(.name == "Overlay Chat").settings.width) = 750

| (.sources[] | select(.name == "cams").filters[] | select(.id == "mask_filter").settings.image_path) |= sub("gp";"gp40")
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").bounds.x) = 352
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").pos.x) = 1094

| del(.sources[] | select(.name == "cams").settings.items[] |select(.name == "External").rot)

| del(.DesktopAudioDevice1)

| del(.. |
	select(
		.key? == "OBS_KEY_F",
		.key? == "OBS_KEY_G",
		.key? == "OBS_KEY_H",
		.name? == "NDI",
		.name? == "guest",

		.enabled? == "false",
#		.key? == "OBS_KEY_M",
		.name? == "Screen Capture",
		.name? == "NDI Audio"
	)
)

| del(.sources[].hotkeys[
	"libobs.hide_scene_item.NDI",
	"libobs.show_scene_item.NDI",
	"libobs.show_scene_item.Screen Capture"
	]
)
