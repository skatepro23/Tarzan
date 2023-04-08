function fEntityMovement(){

pauseCooldown -= 1
walkCooldown -= 1

if (state == "idle" && walkCooldown <= 0 && walkingRightNow == true) {
	pauseCooldown = random_range(walkTimeBottomLimit,walkTimeUpperLimit)
	walkingRightNow = false
}

if (state == "idle" && pauseCooldown <= 0 && walkingRightNow = false) {
	walkCooldown = random_range(walkTimeBottomLimit,walkTimeUpperLimit)
	
	t = random_range(0,2*pi)
	moveDirection_x = cos(t)
	moveDirection_y = sin(t)
	
	walkingRightNow = true
}

if (walkingRightNow == true) {
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
}