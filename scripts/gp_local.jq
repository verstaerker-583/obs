.name = "gp_local"

| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"gp40")

| (.sources[] | select(.name == "cams").filters[] | select(.id == "mask_filter").settings.image_path) |= sub("camsMask";"camsMaskLocal")
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").bounds.x) = 352
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").pos.x) = 1094

| del(.sources[] | select(.name == "cams").settings.items[] |select(.name == "External").rot)
