(.sources[] | select(.id == "display_capture").settings.display) = 0 
#| (.sources[] | select(.name == "External").settings.device) = "0x14100000046d0823"
| (.sources[] | select(.name == "External").settings.device) = "CC27327P54QGDV4AV"
| (.sources[] | select(.name == "Guest").settings.url) = "https://rtc.ninja/beta?aj&clean&np&wc&optimize=0&ad&vd=obs&push=verstaerker583host&pull=verstaerker583guest"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"
