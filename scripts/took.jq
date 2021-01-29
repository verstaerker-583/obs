del(..|.hotkeys?)
| (.sources[] | select(.id == "display_capture").settings.display) = 0 
| (.sources[] | select(.name == "External").settings.device) = "CC27327P54QGDV4AV"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"

| (.sources[] | select(.name == "Host").settings.url) = "https://rtc.ninja/beta?ad&aj&bc&mvb=200&vd=obs&wc&r=verstaerker583mm&push=host"
| (.sources[] | select(.name == "GuestA").settings.url) = "https://rtc.ninja/beta?optimize=0&q=2&scene&r=verstaerker583mm&pull=guestA"
| (.sources[] | select(.name == "GuestB").settings.url) = "https://rtc.ninja/beta?optimize=0&q=2&scene&r=verstaerker583mm&pull=guestB"
| (.sources[] | select(.name == "GuestX").settings.url) = "https://rtc.ninja/beta?optimize=0&q=2&scene&r=verstaerker583mm&pull=guestX"

| setpath(["modules","scripts-tool",0,"path"];"/Users/olaf/Library/Application Support/UPDeck/UPDeck_2-1-19.lua")
| setpath(["modules","scripts-tool",0,"settings","msgPath"];"/Users/olaf/Library/Application Support/UPDeck")
