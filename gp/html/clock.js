"use strict";
var alarmAngle;
var hourAngle;

window.addEventListener('load', updateTime);
window.addEventListener('load', setAlarm);

function checkAlarm() {
	if (hourAngle === alarmAngle) {
		document.getElementById("clockFaceBackground").style.fill = "#ff0032";
	} else {
		document.getElementById("clockFaceBackground").style.fill = "none"; 
	}
}

function checkOBSStatus() {
	if (window.obsstudio) {
		window.obsstudio.getStatus(function (status) {
			switch (true) {
				case (status.recording):
				case (status.streaming):
					document.getElementById("marker").style.fill = "white"; 
					break;
				default:
					document.getElementById("marker").style.fill = "yellow"; 
			}
		});
	}
}

function setAlarm() {
	if (typeof alarm !== 'undefined') {
		var strs = alarm.time.split(":");
		var hours = strs[0] % 12;
		var minutes = strs[1];
		alarmAngle = (180 + (hours + minutes / 60) * 30) % 360;
		var elmnt = document.getElementById("alarmHand");
		elmnt.setAttribute("transform", "rotate(" + (alarmAngle) + ")");
		elmnt.style.visibility = "visible";
	}
}

function updateTime() {
	var date = new Date();
	var hours = 2 + date.getUTCHours();
	var minutes = date.getMinutes();
	var seconds = date.getSeconds();
	hours = hours % 12;
	hourAngle = (180 + (hours + minutes / 60) * 30) % 360;
	var minuteAngle = (180 + minutes * 6) % 360;
	var secondAngle = (180 + seconds * 6) % 360;
	document.getElementById("hourHand").setAttribute("transform", "rotate(" + (hourAngle) + ")");
	document.getElementById("minuteHand").setAttribute("transform", "rotate(" + (minuteAngle) + ")");
	document.getElementById("secondHand").setAttribute("transform", "rotate(" + (secondAngle) + ")");
	checkAlarm();
	checkOBSStatus();
	setTimeout(updateTime, 1000);
}
