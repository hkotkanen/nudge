function startCountingDown(seconds) {
	var millisLeft = seconds * 1000
	var countdownElement = document.getElementById("observation-session-countdown")

	var countdownTimer = setInterval(function showCountdown() {
		if (millisLeft <= 0) {
			clearInterval(countdownTimer)
			countdownElement.parentElement.innerHTML = "Session finished! Redirecting you..."
			document.getElementById("end-session-button").click()
		} else {
			countdownElement.textContent = (millisLeft/1000) + "s"
		}
		millisLeft -= 100
	}, 100)
}

document.onload = startCountingDown(30)
