var w0 = window.innerWidth;
var h0 = window.innerHeight;
var x0 = 0;
var y0 = 0;

var h1 = h0 * 4/5;
var w1 = 3 * h1 / 2;
var x1 = (w0 - w1) / 2;
var y1 = (h0 - h1) / 3;

var w2 = 2 * h1 / 3;
var x2 = w0 - x1 - w2; 

var path0 = "M0 0 h" + w0 + "v" + h0 + "h" + -w0 + "z";

function backgroundA(svg) {
	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", 'path');

	var path1 = "M" + x1 + " " + y1 + "v" + h1 + "h" + w1 + "v" + -h1 + "z";
	var path = path0 + path1;

	elmnt.setAttribute("d",path);
	elmnt.classList.add("background");

	svg.appendChild(elmnt);
}

function backgroundB(svg) {
	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", 'path');

	var path1 = "M" + x1 + " " + y1 + "v" + h1 + "h" + w2 + "v" + -h1 + "z";
	var path2 = "M" + x2 + " " + y1 + "v" + h1 + "h" + w2 + "v" + -h1 + "z";
	var path = path0 + path1 + path2;

	elmnt.setAttribute("d",path);
	elmnt.classList.add("background");

	svg.appendChild(elmnt);
}

function build(scene) {
	var svg = document.getElementById("container");

	var URL = location.pathname;
	var PageName = URL.substring(URL.lastIndexOf("/") + 1);
	PageName = PageName.substring(0, PageName.lastIndexOf("."));
	switch (PageName) {
	case "cam":
		backgroundB(svg);
		break;
	case "finish":
		backgroundA(svg);
		break;
	case "screen":
		backgroundA(svg);
		break;
	case "start":
		backgroundA(svg);
		break;
	}
}
