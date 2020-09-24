.name = "bd_naked"

| del(.[] | select(.name? == "NDI Audio").filters[] | select(.id != "limiter_filter"))

| del(.. |
	select(.name? == "Capture"),
	select(.key? == "OBS_KEY_D"),
	select(.key? == "OBS_KEY_G"),
	select(.key? == "OBS_KEY_M")
)

| del(.sources[]|select(.name == "NDI").filters[] | select(.id != "mask_filter"))
| del(.sources[].hotkeys["libobs.show_scene_item.Capture"])
