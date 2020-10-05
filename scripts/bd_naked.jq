.name = "bd_naked"

| del(.[] | select(.name? == "NDI Audio").filters[] | select(.id != "limiter_filter"))

| del(.. |
	.mixers?,
	select(
		.key? == "OBS_KEY_D",
		.key? == "OBS_KEY_G",
		.key? == "OBS_KEY_M",
		.name? == "Capture"
	)
)

| del(.sources[]|select(.name == "NDI").filters[] | select(.id != "mask_filter"))
| del(.sources[].hotkeys["libobs.show_scene_item.Capture"])
