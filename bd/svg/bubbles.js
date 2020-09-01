"use strict";
var r = 196 / 2 + 5;
var svg = document.documentElement;
var svgNS = "http://www.w3.org/2000/svg";

window.addEventListener('load', bubbles);

function background() {
	var elmnt = document.createElementNS(svgNS, "rect");
	elmnt.classList.add("background");
	svg.appendChild(elmnt);
}

function banner() {
	var elmnt = svgText("#buntgespräch", "25%", "5%");
	elmnt.classList.add("logo");
	elmnt.setAttribute("onclick", "questionmarks(this)");
	svgText("buntdenker.de", "75%", "95%").classList.add("logo");
}

function bubble(name, offset, myClass) {
	var elmnt = document.createElementNS(svgNS, "circle");
	elmnt.classList.add(myClass);
	elmnt.setAttribute("r", r - 5);
	svg.appendChild(elmnt);

	var path = "M0 0 m" + -r + " 0 a1 1 0 0 0 " + 2 * r + " 0 a1 1 0 0 0 " + 2 * -r + " 0";
	elmnt = document.createElementNS(svgNS, "path");
	elmnt.classList.add("frames");
	elmnt.classList.add(myClass);
	elmnt.id = name;
	elmnt.setAttribute("d", path);

	var text = document.createElementNS(svgNS, "text");
	text.classList.add("names");
	text.setAttribute("dy", "0.6em");
	var textPath = document.createElementNS(svgNS, "textPath");
	textPath.classList.add("names");
	textPath.setAttribute("href", "#" + name);
	textPath.setAttribute("startOffset", offset);
	textPath.textContent = name;
	text.appendChild(textPath);
	svg.appendChild(text);

	svg.appendChild(elmnt);
}

function bubbles() {
	var URL = location.pathname;
	var PageName = URL.substring(URL.lastIndexOf("/") + 1);
	PageName = PageName.substring(0, PageName.lastIndexOf("."));
	switch (PageName) {
		case "start":
			commons();
			svgText("Gleich geht's los!", "50%", "20%");
			bubble("Lutz Jäkel", "37.5%", "Lutz");
			bubble("Markus Mauthe", "12.5%", "Markus");
			break;
		case "cam":
			r = 305;
			background();
			bubble("Lutz Jäkel", "37.5%", "LutzBackground");
			bubble("Markus Mauthe", "12.5%", "MarkusBackground");
			break;
		case "mm":
			r = 330;
			background();
			bubble("Markus Mauthe", "25%", "MarkusSolo");
			break;
		case "cams":
			bubble("Lutz Jäkel", "25%", "LutzCams");
			bubble("Markus Mauthe", "25%", "MarkusCams");
			break;
		case "finish":
			commons();
			svgText("Vielen Dank und auf Wiedersehen!", "50%", "20%");
			bubble("Lutz Jäkel", "37.5%", "LutzYT");
			bubble("Markus Mauthe", "12.5%", "MarkusYT");
			break;
	}
	banner();
}

function checkOBSStatus() {
	if (window.obsstudio) {
		window.obsstudio.getStatus(function (status) {
			switch (true) {
				/*
				case (status.recording):
				*/
				case (status.streaming):
					document.getElementById("clock").style.fill = "white";
					break;
				default:
					document.getElementById("clock").style.fill = "yellow";
			}
		});
	}
}

function commons() {
	background();
	loadClock();
	bubble("", "25%", "Buntdenker");
}

function loadClock() {
	var elmnt = document.createElementNS(svgNS, "text");
	elmnt.classList.add("text");
	elmnt.id = "clock";
	elmnt.setAttribute("x", "50%");
	elmnt.setAttribute("y", "80%");
	svg.appendChild(elmnt);
	updateTime();
}

function questionmarks(id) {
	var question = "??? buntgefragt ???";
	if (id.textContent === question) {
		id.textContent = "#buntgespräch";
	} else {
		id.textContent = question;
	}
}

function updateTime() {
	var date = new Date();
	var options = {
		timeZone: 'Europe/Berlin'
	};
	svg.getElementById("clock").textContent = date.toLocaleString('de-DE', options);
	checkOBSStatus();
	setTimeout(updateTime, 1000);
}

function svgText(text, x, y) {
	var elmnt = document.createElementNS(svgNS, "text");
	elmnt.classList.add("text");
	elmnt.setAttribute("x", x);
	elmnt.setAttribute("y", y);
	elmnt.textContent = text;
	svg.appendChild(elmnt);
	return elmnt;
}
