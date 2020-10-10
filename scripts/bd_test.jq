.name = "bd_test"
| del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(
					.name == "Overlay Chat",
					.name == "Overlay Donate",
					.name == "Video",
					.name == "guest",
					.name == "screen",
#					.name == "Color Source",
#					.name == "Slide Show"
					.name == "Screen Capture"
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.Overlay Chat",
					"libobs.hide_scene_item.Overlay Donate",
					"libobs.hide_scene_item.Video",
					"libobs.hide_scene_item.guest",
					"libobs.hide_scene_item.screen",
					"libobs.show_scene_item.Overlay Chat",
					"libobs.show_scene_item.Overlay Donate",
					"libobs.show_scene_item.Video",
					"libobs.show_scene_item.guest",
					"libobs.show_scene_item.screen",
#					"libobs.show_scene_item.Color Source",
#					"libobs.show_scene_item.Slide Show"
					"libobs.show_scene_item.Screen Capture"
				]
			)
	),
	.DesktopAudioDevice1,
	.AuxAudioDevice2,
	(
		.. | select(
			.key? == "OBS_KEY_F",
			.key? == "OBS_KEY_G",
			.key? == "OBS_KEY_H",
			.key? == "OBS_KEY_V",
			.enabled? == "false"
			)
	)
)
| (.sources[] | select(.id == "browser_source").settings.url) |= gsub("html";"svg")
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"bd")
| (.sources[] | select(.id == "color_source").settings.color) = 4288269363
| (.sources[] | select(.name == "?").settings.color1) = 4284888012
| (.sources[] | select(.name == "?").settings.color2) = 4294967295

| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "External", .name == "Internal", .name == "NDI").bounds.x) = 600
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "External", .name == "Internal", .name == "NDI").bounds.y) = 600
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "External", .name == "Internal", .name == "NDI").bounds_type) = 3
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "External", .name == "Internal").pos.x) = 960
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "External", .name == "Internal").pos.y) = 324
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "NDI").pos.x) = 320
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "NDI").pos.y) = 396

| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External", .name == "Internal", .name == "NDI").bounds.x) = 196
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External", .name == "Internal", .name == "NDI").bounds.y) = 196
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External", .name == "Internal").pos.x) = 1152
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External", .name == "Internal").pos.y) = 324
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "NDI").pos.x) = 128
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "NDI").pos.y) = 396

#| (.sources[] | .settings.items[] | select(.name == "NDI").pos.x) = 640
#| (.sources[] | .settings.items[] | select(.name == "NDI").pos.y) = 320
| del(.sources[] | select(.name == "cams").filters)

| (.sources[] | select(.id == "av_capture_input").filters) |= . + [{"id": "mask_filter"}]
| (.sources[] | select(.id == "av_capture_input").filters[] | select(.id == "mask_filter").name) = "Image Mask/Blend"
| (.sources[] | select(.id == "av_capture_input").filters[] | select(.id == "mask_filter").settings.image_path) = "https://verstaerker-583.github.io/obs/bd/camMask.png"
| (.sources[] | select(.id == "av_capture_input").filters[] | select(.id == "mask_filter").settings.type) = "mask_alpha_filter.effect"
