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

#demo
| del(.sources[] |
	select(.id == "av_capture_input").settings
)

| (.sources[] | select(.name == "Internal", .name == "External").id) = "image_source"
| (.sources[] | select(.name == "Internal").settings.file) = "/users/olaf/Documents/demo/internal.png"
| (.sources[] | select(.name == "External").settings.file) = "/users/olaf/Documents/demo/external.png"
| (.sources[] | select(.id == "slideshow").settings.files[].value) = "https://www.butenunbinnen.de/bilder/greenpeace-akw-unterweser-aktion-100~_v-800x450_c-1571126119329.jpg"
| (.sources[] | select(.id == "slideshow").settings.files[2].value) = "https://www.butenunbinnen.de/bilder/fischtrawler-fisch-frachter-bremerhaven-greenpeace-aktion-100~_v-2560x1440_c-1571126120837.jpg"
