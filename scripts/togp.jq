del(.sources[] | 
	select(.id == "ffmpeg_source").settings,
	select(.id == "slideshow").settings.files
)

| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/olaf/Documents/gp40/intro"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/olaf/Documents/gp40/outro"
| (.sources[] | select(.name == "Video").settings.local_file) = "/Users/olaf/Documents/gp40/video"
		
| (.sources[] | select(.id == "slideshow").settings.files[0].value) = "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/atom_unterweser.jpg"
| (.sources[] | select(.id == "slideshow").settings.files[1].value) = "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/brent_spar_1.jpg"
| (.sources[] | select(.id == "slideshow").settings.files[2].value) = "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/gp02oc1.jpg"
| (.sources[] | select(.id == "slideshow").settings.files[3].value) = "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/gp030rj_medium_res_walfang.jpg"
| (.sources[] | select(.id == "slideshow").settings.files[4].value) = "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/gp0stoc2o_medium_res.jpg"
| (.sources[] | select(.id == "slideshow").settings.files[5].value) = "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/nuclear_free_seas.jpg"
