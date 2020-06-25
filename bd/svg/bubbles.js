"use strict";
var svgNS = "http://www.w3.org/2000/svg";
var r = 196 / 2 + 5;
var svg = document.documentElement;

function background() {
	var elmnt = document.createElementNS(svgNS, "rect");
	elmnt.classList.add("background");
	svg.appendChild(elmnt);
}

function banner() {
	var elmnt = svgText("#buntgespräch", "25%", "05%")
	elmnt.classList.add("logo")
	elmnt.setAttribute("onclick", "questionmarks(this)");
	svgText("buntdenker.de", "75%", "95%").classList.add("logo");
}

function bubble(name, offset) {
	var path = "M0 0 m" + -r + " 0 a1 1 0 0 0 " + 2 * r + " 0 a1 1 0 0 0 " + 2 * -r + " 0";
	var elmnt = document.createElementNS(svgNS, "path");
	elmnt.classList.add("frames");
	elmnt.id = name;
	elmnt.setAttribute("d", path);
	var text = document.createElementNS(svgNS, "text");
	text.classList.add("names");
	text.setAttribute("dy", "1em");
	var textPath = document.createElementNS(svgNS, "textPath");
	textPath.setAttribute("href", "#" + name + "");
	textPath.setAttribute("startOffset", offset);
	textPath.textContent = name;
	text.appendChild(textPath);
	svg.appendChild(text);
	svg.appendChild(elmnt);
	return elmnt;
}

function bubbles() {
	var URL = location.pathname;
	var PageName = URL.substring(URL.lastIndexOf("/") + 1);
	PageName = PageName.substring(0, PageName.lastIndexOf("."));
	switch (PageName) {
		case "start":
			commons();
			svgText("Gleich geht's los!", "50%", "25%").classList.add("text");
			useImage("#Lutz", "Lutz");
			useImage("#Markus", "Markus");
			break;
		case "cam":
			r = 305;
			background();
			bubble("Lutz Jäkel", "37.5%").classList.add("Lutz");
			bubble("Markus Mauthe", "12.5%").classList.add("Markus");
			useImage("#LutzBig", "Lutz");
			break;
		case "cams":
			bubble("Lutz Jäkel", "25%").classList.add("camsLutz");
			bubble("Markus Mauthe", "25%").classList.add("camsMarkus");
			useImage("#Lutz", "camsLutz");
			break;
		case "finish":
			commons();
			svgText("Vielen Dank und auf Wiedersehen!", "50%", "25%").classList.add("text");
			useImage("#LutzYT", "Lutz");
			useImage("#MarkusYT", "Markus");
			break;
	}
	banner();
}

function checkOBSStatus() {
	if (window.obsstudio) {
		window.obsstudio.getStatus(function (status) {
			switch (true) {
				case (status.recording):
				case (status.streaming):
					document.getElementById("clock").style.fill = "white"; 
					break;
				default:
					document.getElementById("clock").style.fill = "yellow"; 
			}
		});
	}
}

function checkTime(i) {
	if (i < 10) {
		i = "0" + i
	};
	return i;
}

function commons() {
	background();
	bubble("Lutz Jäkel", "37.5%").classList.add("Lutz");
	bubble("Markus Mauthe", "12.5%").classList.add("Markus");
	loadClock();
	useImage("#buntdenker", "buntdenker");
}

function loadClock() {
	var elmnt = document.createElementNS(svgNS, "text");
	elmnt.setAttribute("x", "50%");
	elmnt.setAttribute("y", "50%");
	elmnt.classList.add("text");
	elmnt.id = "clock";
	svg.appendChild(elmnt);
	startTime();
}

function questionmarks(id) {
	var question = "??? buntgefragt ???";
	if (id.textContent === question) 
		id.textContent = "#buntgespräch";
	else
		id.textContent = question;
}

function startTime() {
	var today = new Date();
	var h = today.getUTCHours();
	var m = today.getMinutes();
	var s = today.getSeconds();
	m = checkTime(m);
	s = checkTime(s);
	svg.getElementById("clock").textContent = h + ":" + m + ":" + s + " UTC ";
	checkOBSStatus();
	var t = setTimeout(startTime, 500);
}

function svgText(text, x, y) {
	var elmnt = document.createElementNS(svgNS, "text");
	elmnt.setAttribute("x", x);
	elmnt.setAttribute("y", y);
	elmnt.textContent = text;
	svg.appendChild(elmnt);
	return elmnt;
}

function useImage(id, myClass) {
	var elmnt = document.createElementNS(svgNS, "use");
	elmnt.classList.add(myClass);
	elmnt.setAttribute("href", id);
	svg.appendChild(elmnt);
}
