#del(..|.hotkeys?)
.
| (.sources[] | select(.id == "display_capture").settings.display) = 0 
| (.sources[] | select(.name == "External").settings.device) = "CC27327P54QGDV4AV"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"

| (.sources[] | select(.name == "Host").settings.url) = "https://rtc.ninja/beta?ad&aj&clean&bc&mvb=200&push=host&r=verstaerker583mm&vd=obs&wc"
| (.sources[] | select(.name == "Guest").settings.url) = "https://rtc.ninja/beta?ad&aj&clean&mvb=200&push=host&r=verstaerker583mm&vd=obs&wc&optimize=0&q=2&bc=Guest"
| (.sources[] | select(.name == "GuestA").settings.url) = "https://rtc.ninja/beta?optimize=0&q=2&r=verstaerker583mm&scene&pull=GuestA"
| (.sources[] | select(.name == "GuestB").settings.url) = "https://rtc.ninja/beta?optimize=0&q=2&r=verstaerker583mm&scene&pull=GuestB"
| (.sources[] | select(.name == "GuestX").settings.url) = "https://rtc.ninja/beta?optimize=0&q=2&r=verstaerker583mm&scene&pull=GuestX"

| setpath(["modules","scripts-tool",0,"path"];"/Users/olaf/Library/Application Support/UPDeck/UPDeck_2-1-19.lua")
| setpath(["modules","scripts-tool",0,"settings","msgPath"];"/Users/olaf/Library/Application Support/UPDeck")
