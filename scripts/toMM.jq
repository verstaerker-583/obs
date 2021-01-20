if .name == "bd" then
	del(
		(
			.. | select(
				.enabled? == "false",
				.key? == (
					"OBS_KEY_D",
					"OBS_KEY_G",
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
					"?",
					"Guest",
					"Overlay Chat",
					"guest"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.?",
					"libobs.hide_scene_item.Guest",
					"libobs.hide_scene_item.Overlay Chat",
					"libobs.hide_scene_item.guest",
					"libobs.show_scene_item.?",
					"libobs.show_scene_item.Guest",
					"libobs.show_scene_item.Overlay Chat",
					"libobs.show_scene_item.guest"
					]
			),
			(
				.. | select(.key? == (
					"OBS_KEY_F",
					"OBS_KEY_G",
					"OBS_KEY_H"
					)
				)
			)
		)
	)
	| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "screen").pos.y) = 475
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
#| (.sources[] | select(.name == "External").settings.device) = "0x2543000043e9a4d"
| (.sources[] | select(.name == "External").settings.device) = "0x8020000005ac8514"
| (.sources[] | select(.name == "Internal").settings.device) = "0x8020000005ac8514"
| (.sources[] | select(.name == "Send").settings.url) = "https://rtc.ninja/beta/?ad&aj&bc&wc&vd=obs&r=verstaerker583&push=host"
| (.sources[] | select(.name == "Guest").settings.url) = "https://rtc.ninja/beta/?optimize=0&scene=1&r=verstaerker583"
| (.sources[] | select(.name == "GuestB").settings.url) = "https://rtc.ninja/beta/?optimize=0&scene&r=verstaerker583&pull=guestB"
| (.sources[] | select(.name == "Overlay Chat").settings.url) = "https://verstaerker-583.github.io/obs/gp/html/chat.html"
