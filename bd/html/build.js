var w0 = 1280;
var h0 = 720;
var x0 = 0;
var y0 = 0;

var h1 = h0 * 4/5;
var w1 = 3 * h1 / 2;
var x1 = (w0 - w1) / 2;
var y1 = (h0 - h1) / 3;

var w2 = 2 * h1 / 3;
var x2 = w0 - x1 - w2; 

var path0 = "M0 0 h"+w0+"v"+h0+"h"+-w0+"z";

function cams(svg) {
	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "rect");
	elmnt.setAttribute("width",h1/3);
	elmnt.setAttribute("height",h1/2);
	elmnt.setAttribute("x",-h1/6);
	elmnt.setAttribute("y",-h1/4);
	elmnt.setAttribute("transform","translate(106,360) rotate(-2)")
	elmnt.classList.add("frames");
	svg.appendChild(elmnt);
}

function backgroundA(svg) {
	var path1 = "M"+x1+" "+y1+"v"+h1+"h"+w1+"v"+-h1+"z";


	var path = path0 + path1;
	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "path");
	elmnt.setAttribute("d",path);
	elmnt.classList.add("background");
	svg.appendChild(elmnt);


	path = path1;
	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "path");
	elmnt.setAttribute("d",path);
	elmnt.classList.add("frames");
	svg.appendChild(elmnt);
}

function backgroundB(svg) {
	var r = 280;
	var cx1 = 1280/4;
	var cx2 = 1280 * 3/4;
	var cy1 = 370;
	var cy2 = 310;
	var path1 = "M "+cx1+" "+cy1+" m -"+r+" 0 a "+r+" "+r+" 0 1 0 "+(r*2)+" 0 a "+r+" "+r+" 0 1 0 -"+(r*2)+" 0"; 
	var path2 = "M "+cx2+" "+cy2+" m -"+r+" 0 a "+r+" "+r+" 0 1 0 "+(r*2)+" 0 a "+r+" "+r+" 0 1 0 -"+(r*2)+" 0"; 

	var path = path0 + path1 + path2;
	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "path");
	elmnt.setAttribute("d",path);
	elmnt.classList.add("background");
	svg.appendChild(elmnt);

	path = path1;
	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "path");
	elmnt.setAttribute("d",path);
	elmnt.classList.add("frames");
	elmnt.id = "path1";
	svg.appendChild(elmnt);

	path = path2;
	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "path");
	elmnt.setAttribute("d",path);
	elmnt.classList.add("frames");
	elmnt.id = "path2";
	svg.appendChild(elmnt);

	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "use");
	elmnt.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#buntdenker");
	svg.appendChild(elmnt);

	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "use");
	elmnt.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#Lutz");
	svg.appendChild(elmnt);

	var elmnt = document.createElementNS("http://www.w3.org/2000/svg", "use");
	elmnt.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#Markus");
	svg.appendChild(elmnt);
}

function build(evt) {
	var svg = evt.target;

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
		cams(svg);
		break;
	}
}
