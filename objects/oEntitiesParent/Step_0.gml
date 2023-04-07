pauseCooldown -= 1
walkCooldown -= 1

if (state == "idle" && walkCooldown <= 0 && walkingRN == true) {
	pauseCooldown = random_range(walkTimeBottomLimit,walkTimeUpperLimit)
	walkingRN = false
}

if (state == "idle" && pauseCooldown <= 0 && walkingRN = false) {
	walkCooldown = random_range(walkTimeBottomLimit,walkTimeUpperLimit)
	
	t = random_range(0,2*pi)
	moveDirection_x = cos(t)
	moveDirection_y = sin(t)
	
	walkingRN = true
}

if (walkingRN == true) {
	if (!place_meeting(x + moveDirection_x*walkSpeed, y, oWallParent)) {
		moveX = moveDirection_x*walkSpeed
	}
	else {
		moveX = 0
	}
	if (!place_meeting(x, y + moveDirection_y*walkSpeed, oWallParent)) {
		moveY = moveDirection_y*walkSpeed
	}
	else {
		moveY = 0
	}
}
else {
	moveX = 0
	moveY = 0
}