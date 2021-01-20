(.sources[] | select(.id == "display_capture").settings.display) = 0 
#| (.sources[] | select(.name == "External").settings.device) = "0x14100000046d0823"
| (.sources[] | select(.name == "External").settings.device) = "CC27327P54QGDV4AV"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"

| (.sources[] | select(.name == "Send").settings.url) = "https://rtc.ninja/beta/?ad&aj&bc&wc&vd=obs&r=verstaerker583&push=host"
| (.sources[] | select(.name == "Guest").settings.url) = "https://rtc.ninja/beta/?optimize=0&scene=1&r=verstaerker583"
| (.sources[] | select(.name == "GuestB").settings.url) = "https://rtc.ninja/beta/?optimize=0&scene&r=verstaerker583&pull=guestA"
