if .name == "bd" then
	del(
		(
			.. | select(
				.enabled? == "false",
				.key? == (
					"OBS_KEY_D",
					"OBS_KEY_M"
					)
			)
		)
	)

elif .name == "gp" then
del(
		(
			.sources[] |
				(
					., .settings.items[]? | select(.name == (
						"GuestA",
						"GuestB",
						"GuestX",
						"Host",
						"guest"
						)
					)
				),
				(
					.hotkeys[
						"libobs.hide_scene_item.GuestA",
						"libobs.hide_scene_item.GuestB",
						"libobs.hide_scene_item.GuestX",
						"libobs.show_scene_item.GuestA",
						"libobs.show_scene_item.GuestB",
						"libobs.show_scene_item.GuestX"
						]
				)
		),
		(
			.. | select(
				.key? == (
					"OBS_KEY_F",
					"OBS_KEY_V",
					"OBS_KEY_B",
					"OBS_KEY_N",
					"OBS_KEY_X",
					"OBS_KEY_G",
					"OBS_KEY_H"
					)
			)
		)
	)
	| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "display").pos.y) = 475
	| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/intro"
	| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/outro"

elif .name == "mm" then
	(.sources[] | select(.name == "Intro").settings.local_file) = "/Users/markus/Documents/AlleinKannIchDieWeltNichtRetten/intro"
	| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/markus/Documents/AlleinKannIchDieWeltNichtRetten/outro"
else
	.
end

| del(
	(
		.sources[] |
			(
				select(.name == "Cam").settings.items[] | select(.name == "External")
			),
			(
				select(.name == "Cam").hotkeys[
					"libobs.hide_scene_item.External",
					"libobs.show_scene_item.External"
					]
			)
	)
)
| (.sources[] | select(.name == "External").settings.device) = "0x2543000043e9a4d"
| (.sources[] | select(.name == "External").settings.device) = "0x8020000005ac8514"
| (.sources[] | select(.name == "Internal").settings.device) = "0x8020000005ac8514"

| (.sources[] | select(.name == "Host").settings.url) = "https://rtc.ninja/beta?ad&aj&clean&bc&mvb=200&push=host&r=verstaerker583mm&vd=obs&wc"
| (.sources[] | select(.name == "GuestA").settings.url) = "https://rtc.ninja/beta?optimize=0&q=2&r=verstaerker583mm&scene&pull=GuestA"
| (.sources[] | select(.name == "GuestB").settings.url) = "https://rtc.ninja/beta?optimize=0&q=2&r=verstaerker583mm&scene&pull=GuestB"
| (.sources[] | select(.name == "GuestX").settings.url) = "https://rtc.ninja/beta?optimize=0&q=2&r=verstaerker583mm&scene&pull=GuestX"
| (.sources[] | select(.name == "Remote").settings.url) = "https://rtc.ninja/beta?ad&aj&clean&mvb=200&push=host&r=verstaerker583mm&vd=obs&wc&optimize=0&q=2&bc=Remote"
