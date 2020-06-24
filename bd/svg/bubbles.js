svgNS = "http://www.w3.org/2000/svg";

var heightLeft = 400;
var heightRight = 320;
var r = 196 / 2 + 5;

function xLeft(r) {
	return r + 5;
}

function xRight(r) {
	return rect.width - (r + 5);
}

function yLeft(r) {
	return rect.height - (r + 5);
}

function yRight(r) {
	return r + 5;
}

var svg = document.documentElement;
var rect = svg.getBoundingClientRect();

function checkTime(i) {
	if (i < 10) {
		i = "0" + i
	}; // add zero in front of numbers < 10
	return i;
}

function startTime() {
	var today = new Date();
	var h = today.getUTCHours();
	var m = today.getMinutes();
	var s = today.getSeconds();
	m = checkTime(m);
	s = checkTime(s);
	svg.getElementById("clock").textContent = h + ":" + m + ":" + s;

	var t = setTimeout(startTime, 500);
}

function loadClock() {
	var elmnt = document.createElementNS(svgNS, "text");
	elmnt.setAttribute("x", "43%");
	elmnt.setAttribute("y", "50%");
	elmnt.id = "clock";
	svg.appendChild(elmnt);
	startTime();
}

function background() {
	var elmnt = document.createElementNS(svgNS, "rect");
	elmnt.classList.add("background");
	svg.appendChild(elmnt);
}

function banner() {
	var elmnt = document.createElementNS(svgNS, "text");
	elmnt.setAttribute("x", "25%");
	elmnt.setAttribute("y", "05%");
	elmnt.classList.add("logo");
	elmnt.textContent = "#buntgespräch";
	svg.appendChild(elmnt);

	elmnt = document.createElementNS(svgNS, "text");
	elmnt.setAttribute("x", "75%");
	elmnt.setAttribute("y", "95%");
	elmnt.classList.add("logo");
	elmnt.textContent = "buntdenker.de";
	svg.appendChild(elmnt);
}

function bubble(r, cx, cy, name, offset) {
	var path = "M0 0 m" + -r + " 0 a1 1 0 0 0 +" + 2 * r + " 0 a1 1 0 0 0 -" + 2 * r + " 0";

	var elmnt = document.createElementNS(svgNS, "path");
	elmnt.setAttribute("d", path);
	elmnt.setAttribute("transform", "translate(" + cx + "," + cy + ")");
	elmnt.classList.add("frames");
	elmnt.id = "myPath" + cx + "";
	svg.appendChild(elmnt);

	elmnt = document.createElementNS(svgNS, "text");
	elmnt.classList.add("names");
	elmnt.setAttribute("dy", "1em");
	var textPath = document.createElementNS(svgNS, "textPath");
	textPath.setAttribute("href", "#myPath" + cx + "");
	textPath.setAttribute("startOffset", offset);
	textPath.textContent = name;

	elmnt.appendChild(textPath);
	svg.appendChild(elmnt);
}

function bubbles() {
	var URL = location.pathname;
	var PageName = URL.substring(URL.lastIndexOf("/") + 1);
	PageName = PageName.substring(0, PageName.lastIndexOf("."));

	switch (PageName) {
		case "start":
			background();
			loadClock();
			bubble(r, 320, heightLeft, "Markus Mauthe", "12.5%");
			bubble(r, 960, heightRight, "Lutz Jäkel", "37.5%");

			/*
			var elmnt = document.createElementNS(svgNS, "use");
			elmnt.setAttribute("href", "#Lutz");
			elmnt.setAttribute("transform", "translate(960," + heightRight + ")");
			svg.appendChild(elmnt);
			*/
			var elmnt = document.createElementNS(svgNS, "image");
			elmnt.setAttribute("href", "https://static.wixstatic.com/media/b8486a_56df73b6eede4d99b24f7ca93b4f6cfb~mv2.png");
			elmnt.classList.add("images");
			var x = 960 - 98;
			var y = 320 - 98;
			elmnt.setAttribute("transform", "translate(" + x + "," + y + ")");
			svg.appendChild(elmnt);

			elmnt = document.createElementNS(svgNS, "use");
			elmnt.setAttribute("href", "#Markus");
			elmnt.setAttribute("transform", "translate(320," + heightLeft + ")");
			svg.appendChild(elmnt);

			break;
		case "cam":
			background();
			r = 305;
			bubble(r, 320, 400, "Markus Mauthe", "12.5%");
			bubble(r, 960, 320, "Lutz Jäkel", "37.5%");

			/*
			var elmnt = document.createElementNS(svgNS, "use");
			elmnt.setAttribute("href", "#LutzTest");
			elmnt.setAttribute("transform", "translate(960," + heightRight + ")");
			svg.appendChild(elmnt);
			*/
			break;
		case "cams":
			bubble(r, xLeft(r), heightLeft, "Markus Mauthe", "25%");
			bubble(r, xRight(r), heightRight, "Lutz Jäkel", "25%");

			var elmnt = document.createElementNS(svgNS, "use");
			elmnt.setAttribute("href", "#Lutz");
			elmnt.setAttribute("transform", "translate(" + xRight(r) + "," + heightRight + ")");
			svg.appendChild(elmnt);
			break;
		case "finish":
			background();
			loadClock();
			bubble(r, 320, heightLeft, "Markus Mauthe", "12.5%");
			bubble(r, 960, heightRight, "Lutz Jäkel", "37.5%");

			var elmnt = document.createElementNS(svgNS, "use");
			elmnt.setAttribute("href", "#LutzYT");
			elmnt.setAttribute("transform", "translate(960," + heightRight + ")");
			svg.appendChild(elmnt);

			elmnt = document.createElementNS(svgNS, "use");
			elmnt.setAttribute("href", "#MarkusYT");
			elmnt.setAttribute("transform", "translate(320," + heightLeft + ")");
			svg.appendChild(elmnt);

			break;
	}
	banner();
}
