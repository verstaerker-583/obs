"use strict";
window.addEventListener('load', build);

function build() {
	var URL = location.pathname;
	var PageName = URL.substring(URL.lastIndexOf("/") + 1);
	PageName = PageName.substring(0, PageName.lastIndexOf("."));
	switch (PageName) {
		case "start":
			pics.organizationLogo = "";
			/*
			pics.videoThumb = "";
			*/
			buildBanner(start);
			loadClock();
			loadPics();
			position();
			break;
		case "cam":
			pics.channelIcon = "";
			pics.clockLogo = "";
			pics.organizationLogoNeg = "";
			pics.videoThumb = "";
			document.body.style.backgroundColor = "transparent";
			document.body.style.backgroundImage = "none";
			loadPics();
			break;
		case "donate":
			document.body.style.backgroundColor = "transparent";
			document.body.style.backgroundImage = "none";
			buildArrows();
			buildBanner(donate);
			call2action.classList.add("heartbeat");
			break;
		case "chat":
			window.location = "https://www.youtube.com/live_chat?is_popout=1&v=" + video.id;
			break;
		default:
			pics.organizationLogo = "";
			buildBanner(finish);
			loadClock();
			loadPics();
			position();
			channelIcon.classList.add("heartbeat");
			clock.classList.add("heartbeat");
	}
}

function buildArrows() {
	for (const id of ["chat", "description", "infocards"]) {
		var elmnt = document.createElement("span");
		elmnt.classList.add("arrows", "call2action", "heartbeat");
		elmnt.id = id;
		elmnt.textContent = "⇨";
		document.body.appendChild(elmnt);
	}
	description.textContent = "⇩";
}

function buildBanner(object) {
	var banner = document.createElement("span");
	banner.id = "banner";
	for (let [key, value] of Object.entries(object)) {
		var elmnt = document.createElement("span");
		elmnt.classList.add("element", key);
		elmnt.id = key;
		elmnt.textContent = value;
		banner.appendChild(elmnt);
		elmnt = document.createElement("br");
		banner.appendChild(elmnt);
	}
	document.body.appendChild(banner);
}

function loadClock() {
	var elmnt = document.createElement("object");
	elmnt.data = "clock.svg";
	elmnt.id = "clock";
	document.body.appendChild(elmnt);
}

function loadPics() {
	for (let [key, value] of Object.entries(pics)) {
		var elmnt = document.createElement("img");
		elmnt.id = key;
		elmnt.src = value;
		if (value) document.body.appendChild(elmnt);
	}
}

function position() {
	var elmnt = document.getElementById("clock");
	var cssObj = getComputedStyle(elmnt);
	var x0 = parseInt(cssObj.left);
	var y0 = parseInt(cssObj.top);
	elmnt = document.getElementById("organizationLogoNeg");
	cssObj = getComputedStyle(elmnt);
	var x = parseInt(elmnt.offsetWidth) / 2 + parseInt(cssObj.left) + 2;
	elmnt = document.getElementById("channelIcon");
	x -= parseInt(elmnt.offsetWidth) / 2;
	var y = y0 + Math.tan(5 * Math.PI / 180) * (x0 - x);
	elmnt.style.left = x + "px";
	elmnt.style.top = y + "px";
	var width = parseInt(elmnt.offsetWidth);
	elmnt = document.getElementById("banner");
	elmnt.style.left = x + width / 2 + "px";
	elmnt.style.top = y + "px";
	var height = parseInt(elmnt.offsetHeight);
	elmnt.style.paddingLeft = 2 * width / 3 + "px";
	elmnt.style.paddingTop = (width - height) / 2 + "px";
	elmnt.style.transformOrigin = "left center";
}
