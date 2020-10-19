.
| (.sources[] | select(.name == "External").settings.device) = "0x14200000046d0823"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"

| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de/site/assets/files/1046/e1.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de/site/assets/files/1046/e2.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de/site/assets/files/1046/e3.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de/site/assets/files/1046/e4.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de/site/assets/files/1046/e5.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de/site/assets/files/1046/e6.jpg"}]
