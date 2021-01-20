.
| (.sources[] | select(.id == "display_capture").settings.display) = 0 
| (.sources[] | select(.name == "External").settings.device) = "CC27327P54QGDV4AV"
#| (.sources[] | select(.name == "External").settings.device) = "0x14100000046d0823"
#| (.sources[] | select(.name == "External").settings.preset) = "AVCaptureSessionPreset1920x1080"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"

| (.sources[] | select(.name == "Host").settings.url) = "https://rtc.ninja/beta/?ad&aj&bc&mvb=200&vd=obs&wc&r=verstaerker583&pull=director&push=host"
| (.sources[] | select(.name == "GuestA").settings.url) = "https://rtc.ninja/beta/?optimize=0&scene&r=verstaerker583&pull=guestA"
| (.sources[] | select(.name == "GuestB").settings.url) = "https://rtc.ninja/beta/?optimize=0&scene&r=verstaerker583&pull=guestB"
| (.sources[] | select(.name == "GuestX").settings.url) = "https://rtc.ninja/beta/?optimize=0&scene&r=verstaerker583&pull=guestX"

# audiofix ?
| (.sources[] | select(.name == "Host").settings.url) = "https://rtc.ninja/beta/?ad&aj&bc&mvb=200&vd=obs&wc&r=verstaerker583&push=host"
| del (.sources[] | select(.id == "browser_source") | select(.name != "Host").monitoring_type)
