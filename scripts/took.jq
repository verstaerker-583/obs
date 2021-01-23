.
| (.sources[] | select(.id == "display_capture").settings.display) = 0 
| (.sources[] | select(.name == "External").settings.device) = "CC27327P54QGDV4AV"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"

| (.sources[] | select(.name == "Host").settings.url) = "https://rtc.ninja/beta?ad&aj&bc&mvb=200&vd=obs&wc&r=verstaerker583&push=host"
| (.sources[] | select(.name == "GuestA").settings.url) = "https://rtc.ninja/beta?optimize=0&scene&r=verstaerker583&pull=guestA&vb=200"
| (.sources[] | select(.name == "GuestB").settings.url) = "https://rtc.ninja/beta?optimize=0&scene&r=verstaerker583&pull=guestB&vb=200"
| (.sources[] | select(.name == "GuestX").settings.url) = "https://rtc.ninja/beta?optimize=0&scene&r=verstaerker583&pull=guestX&vb=200"

| (.sources[] | select(.name == "Host").settings.url) = "https://rtc.ninja/beta?ad&aj&bc&mvb=200&vd=obs&wc&r=verstaerker583mm&push=host"
| (.sources[] | select(.name == "GuestA").settings.url) = "https://rtc.ninja/beta?optimize=0&scene&r=verstaerker583mm&pull=guestA&vb=200"
| (.sources[] | select(.name == "GuestB").settings.url) = "https://rtc.ninja/beta?optimize=0&scene&r=verstaerker583mm&pull=guestB&vb=200"
| (.sources[] | select(.name == "GuestX").settings.url) = "https://rtc.ninja/beta?optimize=0&scene&r=verstaerker583mm&pull=guestX&vb=200"
