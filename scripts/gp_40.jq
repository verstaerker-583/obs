.name = "gp_40"

| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"gp40")

| del(.sources[] | 
	select(.id == "ffmpeg_source").settings
)

| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/olaf/Documents/gp40/intro"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/olaf/Documents/gp40/outro"
| (.sources[] | select(.name == "Video").settings.local_file) = "/Users/olaf/Documents/gp40/video"

| (.sources[] | select(.name == "cams").filters[] | select(.id == "mask_filter").settings.image_path) |= sub("gp";"gp40")
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").bounds.x) = 352
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").pos.x) = 1094 

| del(.sources[] | select(.name == "cams").settings.items[] |select(.name == "External").rot)

| del(.DesktopAudioDevice1)

| del(.. |
	.mixers?,
	select(
		.key? == "OBS_KEY_F",
		.key? == "OBS_KEY_G",
		.key? == "OBS_KEY_H",
		.name? == "NDI",
		.name? == "guest",

		.enabled? == "false",
		.key? == "OBS_KEY_M",
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
		
#demo
#| del(.sources[] |
#	select(.id == "av_capture_input").settings
#)
#
#| (.sources[] | select(
#		.name == "Internal",
#		.name == "External",
#		.name == "NDI"
#	).id) = "image_source"
#| (.sources[] | select(.name == "Internal").settings.file) = "/users/olaf/Documents/demo/internal.png"
#| (.sources[] | select(.name == "External").settings.file) = "/users/olaf/Documents/demo/external.png"
#| (.sources[] | select(.name == "NDI").settings.file) = "/users/olaf/Documents/demo/ndi.png"
| (.sources[] | select(.id == "slideshow").settings.files[0].value) = "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/atom_unterweser.jpg"
| (.sources[] | select(.id == "slideshow").settings.files[1].value) = "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/brent_spar_1.jpg"
| (.sources[] | select(.id == "slideshow").settings.files[2].value) = "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/gp02oc1.jpg"
| (.sources[] | select(.id == "slideshow").settings.files[3].value) = "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/gp030rj_medium_res_walfang.jpg"
| (.sources[] | select(.id == "slideshow").settings.files[4].value) = "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/gp0stoc2o_medium_res.jpg"
| (.sources[] | select(.id == "slideshow").settings.files[5].value) = "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/nuclear_free_seas.jpg"
