"use strict";var r=196/2+5;var svg=document.documentElement;var svgNS="http://www.w3.org/2000/svg";window.addEventListener("load",bubbles);function background(){var a=document.createElementNS(svgNS,"rect");a.classList.add("background");svg.appendChild(a)}function banner(){var a=svgText("#buntgespräch","25%","5%");a.classList.add("logo");a.setAttribute("onclick","questionmarks(this)");svgText("buntdenker.de","75%","95%").classList.add("logo")}function bubble(b,g,d){var c=document.createElementNS(svgNS,"circle");c.classList.add(d);c.setAttribute("r",r-5);svg.appendChild(c);var e="M0 0 m"+-r+" 0 a1 1 0 0 0 "+2*r+" 0 a1 1 0 0 0 "+2*-r+" 0";c=document.createElementNS(svgNS,"path");c.classList.add("frames");c.classList.add(d);c.id=b;c.setAttribute("d",e);var f=document.createElementNS(svgNS,"text");f.classList.add("names");f.setAttribute("dy","0.6em");var a=document.createElementNS(svgNS,"textPath");a.classList.add("names");a.setAttribute("href","#"+b);a.setAttribute("startOffset",g);a.textContent=b;f.appendChild(a);svg.appendChild(f);svg.appendChild(c)}function bubbles(){var a=location.pathname;var b=a.substring(a.lastIndexOf("/")+1);b=b.substring(0,b.lastIndexOf("."));switch(b){case"start":commons();svgText("Gleich geht's los!","50%","20%");bubble("Lutz Jäkel","12.5%","Lutz");bubble("Markus Mauthe","37.5%","Markus");break;case"cam":r=305;background();bubble("Lutz Jäkel","12.5%","LutzBackground");bubble("Markus Mauthe","37.5%","MarkusBackground");break;case"screen":bubble("Lutz Jäkel","25%","LutzCams");bubble("Markus Mauthe","25%","MarkusCams");break;case"finish":commons();svgText("Vielen Dank und auf Wiedersehen!","50%","20%");bubble("Lutz Jäkel","12.5%","LutzYT");bubble("Markus Mauthe","37.5%","MarkusYT");break}banner()}function checkOBSStatus(){if(window.obsstudio){window.obsstudio.getStatus(function(a){switch(true){case (a.streaming):document.getElementById("clock").style.fill="white";break;default:document.getElementById("clock").style.fill="yellow"}})}}function commons(){background();loadClock();bubble("","25%","Buntdenker")}function loadClock(){var a=document.createElementNS(svgNS,"text");a.classList.add("text");a.id="clock";a.setAttribute("x","50%");a.setAttribute("y","80%");svg.appendChild(a);updateTime()}function questionmarks(b){var a="??? buntgefragt ???";if(b.textContent===a){b.textContent="#buntgespräch"}else{b.textContent=a}}function updateTime(){var b=new Date();var a={timeZone:"Europe/Berlin"};svg.getElementById("clock").textContent=b.toLocaleString("de-DE",a);checkOBSStatus();setTimeout(updateTime,1000)}function svgText(c,a,d){var b=document.createElementNS(svgNS,"text");b.classList.add("text");b.setAttribute("x",a);b.setAttribute("y",d);b.textContent=c;svg.appendChild(b);return b};
