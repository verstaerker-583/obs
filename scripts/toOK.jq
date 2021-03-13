#
(.sources[] | select(.id == "display_capture").settings.display) = 0 
| (.sources[] | select(.name == "External").settings.device) = "CC27327P54QGDV4AV"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"

| (.sources[] | select(.name == "GuestA").settings.url) = "https://rtc.ninja?r=verstaerker583mm&scene&pull=GuestA"
| (.sources[] | select(.name == "GuestB").settings.url) = "https://rtc.ninja?r=verstaerker583mm&scene&pull=GuestB"
| (.sources[] | select(.name == "GuestX").settings.url) = "https://rtc.ninja?r=verstaerker583mm&scene&pull=GuestX"
| (.sources[] | select(.name == "Host").settings.url) = "https://rtc.ninja?ad&aj&clean&bc&mvb=200&push=Host&r=verstaerker583mm&vd=obs&wc"
| (.sources[] | select(.name == "Remote").settings.url) = "https://rtc.ninja?ad&aj&clean&mvb=200&push=host&r=verstaerker583mm&vd=obs&wc&bc=Remote"

| (.sources[] | select(.name == "Intro").settings.local_file) = "/System/Library/PrivateFrameworks/Slideshows.framework/Versions/A/Resources/Content/Styles/PhotoMobile.mrbStyle/Contents/Resources/Preview.mov"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/System/Library/PrivateFrameworks/Slideshows.framework/Versions/A/Resources/Content/Styles/HolidayMobile.mrbStyle/Contents/Resources/Preview.mov"
