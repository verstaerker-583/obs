.
| (.sources[] | select(.name == "External").settings.device) = "0x14200000046d0823"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"

# demo
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e1.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e2.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e3.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e4.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e5.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e6.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e7.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e8.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e9.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e10.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e11.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e12.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e13.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e14.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e17.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e15.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e16.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e18.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e20.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de//site/assets/files/1046/e19.jpg"}]
