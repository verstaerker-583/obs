var svg = document.documentElement;
var rect = svg.getBoundingClientRect();

var heightLeft = 400;
var heightRight = 320;

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
	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "text");
	elmnt.setAttribute("x", "43%");
	elmnt.setAttribute("y", "50%");
	elmnt.id = "clock";
	svg.appendChild(elmnt);
	startTime();
}

function background() {
	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "rect");
	elmnt.setAttribute("width", "100%");
	elmnt.setAttribute("height", "100%");
	elmnt.classList.add("background");
	svg.appendChild(elmnt);
}

function banner() {
	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "text");
	elmnt.setAttribute("x", "25%");
	elmnt.setAttribute("y", "05%");
	elmnt.classList.add("logo");
	elmnt.textContent = "#buntgespräch";
	svg.appendChild(elmnt);

	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "text");
	elmnt.setAttribute("x", "75%");
	elmnt.setAttribute("y", "95%");
	elmnt.classList.add("logo");
	elmnt.textContent = "buntdenker.de";
	svg.appendChild(elmnt);
}

function bubble(r, cx, cy, name, offset) {
	var path = "M0 0 m" + -r + " 0 a1 1 0 0 0 +" + 2 * r + " 0 a1 1 0 0 0 -" + 2 * r + " 0";

	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "path");
	elmnt.setAttribute("d", path);
	elmnt.setAttribute("transform", "translate(" + cx + "," + cy + ")");
	elmnt.classList.add("frames");
	elmnt.id = "myPath" + cx + "";
	svg.appendChild(elmnt);

	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "text");
	elmnt.classList.add("names");
	elmnt.setAttribute("dy", "1em");
	var textPath = document.createElementNS("http://www.w3.org/2000/svg", "textPath");
	textPath.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#myPath" + cx + "");
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
			var r = 196 / 2 + 5;
			bubble(r, 320, heightLeft, "Markus Mauthe", "12.5%");
			bubble(r, 960, heightRight, "Lutz Jäkel", "37.5%");

			var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "use");
			elmnt.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#Lutz");
			elmnt.setAttribute("transform", "translate(960," + heightRight + ")");
			svg.appendChild(elmnt);

			var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "use");
			elmnt.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#Markus");
			elmnt.setAttribute("transform", "translate(320," + heightLeft + ")");
			svg.appendChild(elmnt);

			break;
		case "cam":
			background();
			var r = 315;
			bubble(r, (r + 5), heightLeft, "Markus Mauthe", "12.5%");
			bubble(r, rect.width - (r + 5), heightRight, "Lutz Jäkel", "37.5%");
			break;
		case "screen":
			var r = 196 / 2 + 5;
			bubble(r, (r + 5), heightLeft, "Markus Mauthe", "25%");
			bubble(r, rect.width - (r + 5), heightRight, "Lutz Jäkel", "25%");
			break;
		case "finish":
			background();
			loadClock();
			var r = 196 / 2 + 5;
			bubble(r, 320, heightLeft, "Markus Mauthe", "12.5%");
			bubble(r, 960, heightRight, "Lutz Jäkel", "37.5%");

			var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "use");
			elmnt.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#LutzYT");
			elmnt.setAttribute("transform", "translate(960," + heightRight + ")");
			svg.appendChild(elmnt);

			var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "use");
			elmnt.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#MarkusYT");
			elmnt.setAttribute("transform", "translate(320," + heightLeft + ")");
			svg.appendChild(elmnt);

			break;
	}
	banner();
}
