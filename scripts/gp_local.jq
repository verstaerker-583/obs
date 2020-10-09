.name = "gp_local"

| del(.. | select(.name? == "Screen Capture"))
| del(.DesktopAudioDevice1)
| del(.sources[].hotkeys["libobs.show_scene_item.Screen Capture"])

| (.sources[] | select(.name == "cams").filters[] | select(.id == "mask_filter").settings.image_path) |= sub("camsMask";"camsMaskLocal")
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").bounds.x) = 352
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").pos.x) = 1094
| del(.sources[] | select(.name == "cams").settings.items[] |select(.name == "External").rot)
