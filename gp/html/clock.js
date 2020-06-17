var alarmAngle;
var hourAngle;

function setAlarm() {
	if (alarm.time) {
		var strs = alarm.time.split(":");
		var hours = strs[0] % 12;
		var minutes = strs[1];
		alarmAngle = (180 + (hours + minutes / 60) * 30) % 360;
		document.getElementById("alarmHand").setAttribute("transform", "rotate(" + (alarmAngle) + ")");
		document.getElementById("alarmHand").setAttribute("stroke-width", "3");
	}
}

function checkAlarm() {
	if (hourAngle === alarmAngle) {
		document.getElementById("clockFaceBackground").setAttribute("fill", "#ff0032");
	} else {
		document.getElementById("clockFaceBackground").setAttribute("fill", "none");
	}
}

function checkOBSStatus() {
	if (window.obsstudio) {
		window.obsstudio.getStatus(function (status) {
			switch (true) {
				case (status.recording):
				case (status.streaming):
					document.getElementById("marker").setAttribute("fill", "inherit");
					break;
				default:
					document.getElementById("marker").setAttribute("fill", "yellow");
			}
		});
	} else
		document.getElementById("marker").setAttribute("fill", "inherit");
}

function updateTime() {
	var date = new Date();
	var seconds = date.getSeconds();
	var minutes = date.getMinutes();
	var hours = 2 + date.getUTCHours();
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
