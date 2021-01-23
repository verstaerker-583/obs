"use strict";
var alarmAngle;
var hourAngle;
window.addEventListener("load", updateTime);
window.addEventListener("load", setAlarm);

function checkAlarm() {
	if (hourAngle === alarmAngle) {
		document.getElementById("clockFaceBackground").style.fill = "#ff0032"
	} else {
		document.getElementById("clockFaceBackground").style.fill = "none"
	}
}

function checkOBSStatus() {
	if (window.obsstudio) {
		window.obsstudio.getStatus(function (a) {
			switch (true) {
				case (a.streaming):
					document.getElementById("marker").style.fill = "white";
					break;
				default:
					document.getElementById("marker").style.fill = "yellow"
			}
		})
	}
}

function setAlarm() {
	if (typeof alarmTime !== "undefined") {
		var d = alarmTime.split(":");
		var a = d[0] % 12;
		var c = d[1];
		alarmAngle = (180 + (a + c / 60) * 30) % 360;
		var b = document.getElementById("alarmHand");
		b.setAttribute("transform", "rotate(" + (alarmAngle) + ")");
		b.style.visibility = "visible"
	}
}

function updateTime() {
	var d = new Date();
	var c = 1 + d.getUTCHours();
	var e = d.getMinutes();
	var f = d.getSeconds();
	c = c % 12;
	hourAngle = (180 + (c + e / 60) * 30) % 360;
	var a = (180 + e * 6) % 360;
	var b = (180 + f * 6) % 360;
	document.getElementById("hourHand").setAttribute("transform", "rotate(" + (hourAngle) + ")");
	document.getElementById("minuteHand").setAttribute("transform", "rotate(" + (a) + ")");
	document.getElementById("secondHand").setAttribute("transform", "rotate(" + (b) + ")");
	checkAlarm();
	checkOBSStatus();
	setTimeout(updateTime, 1000)
}
