function loadClock() {
	var elmnt = document.createElement("object");
	elmnt.id = "clock";
	elmnt.data = "clock.svg";
	document.body.appendChild(elmnt);
}

function loadPics() {
	for (let [key, value] of Object.entries(pics)) {
		var elmnt = document.createElement("img");
		elmnt.id = key;
		elmnt.src = value;
		if (value)
			document.body.appendChild(elmnt);
	}
}

function buildArrows() {
	for (const id of ["chat", "description", "infocards"]) {
		var elmnt = document.createElement("span");
		elmnt.id = id;
		/*
		elmnt.innerHTML = "⇨";
		elmnt.classList.add("arrows");
		elmnt.classList.add("call2action");
		elmnt.classList.add("heartbeat");
		*/
		elmnt.textContent = "⇨";
		elmnt.classList.add("arrows","call2action","heartbeat");
		document.body.appendChild(elmnt);
	}
	/*
	description.innerHTML = "⇩";
	*/
	description.textContent = "⇩";
}

function buildBanner(object) {
	var banner = document.createElement("span");
	banner.id = "banner";
	for (let [key, value] of Object.entries(object)) {
		var elmnt = document.createElement("span");
		/*
		elmnt.innerHTML = value;
		elmnt.classList.add("element");
		elmnt.classList.add(key);
		*/
		elmnt.id = key;
		elmnt.textContent = value;
		elmnt.classList.add("element", key);
		banner.appendChild(elmnt);

		var br = document.createElement("br");
		banner.appendChild(br);
	}
	document.body.appendChild(banner);
}

function position() {
	// reference element #1
	var elmnt = document.getElementById("clock");
	var cssObj = getComputedStyle(elmnt);
	var x0 = parseInt(cssObj.left);
	var y0 = parseInt(cssObj.top);
	// reference element #2
	elmnt = document.getElementById("organizationLogo");
	cssObj = getComputedStyle(elmnt);
	var x = parseInt(elmnt.offsetWidth) / 2 + parseInt(cssObj.left) + 2;
	// position channel
	elmnt = document.getElementById("channelIcon");
	x -= parseInt(elmnt.offsetWidth) / 2;
	var y = y0 + Math.tan(5 * Math.PI / 180) * (x0 - x);
	elmnt.style.top = y + "px";
	elmnt.style.left = x + "px";
	// position banner
	var width = parseInt(elmnt.offsetWidth);
	elmnt = document.getElementById("banner");
	elmnt.style.left = x + width / 2 + "px";
	elmnt.style.top = y + "px";
	var height = parseInt(elmnt.offsetHeight);
	elmnt.style.paddingTop = (width - height) / 2 + "px";
	elmnt.style.paddingLeft = 2 * width / 3 + "px";
	elmnt.style.transformOrigin = "left center";
}

function build() {
	var URL = location.pathname;
	var PageName = URL.substring(URL.lastIndexOf("/") + 1);
	PageName = PageName.substring(0, PageName.lastIndexOf("."));
	switch (PageName) {
		case "start":
			buildBanner(start);
			loadClock();
			pics.videoThumb = "";
			loadPics();
			position();
			break;
		case "donate":
			document.body.style.backgroundColor = "transparent";
			document.body.style.backgroundImage = "none";
			buildBanner(donate);
			buildArrows();
			call2action.classList.add("heartbeat");
			break;
		default:
			buildBanner(finish);
			loadClock();
			loadPics();
			position();
			clock.classList.add("heartbeat");
			channelIcon.classList.add("heartbeat");
	}
}
