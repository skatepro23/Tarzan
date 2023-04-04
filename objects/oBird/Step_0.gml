with(this_instance) {

depth = -y;

pauseCooldown -= 1
walkCooldown -= 1

//om fågelns gångräknare är på 0 skapas en 
if (birdState == "idle" && walkCooldown <= 0 && birdWalking == true) {
	pauseCooldown = random_range(walkTimeBottomLimit,walkTimeUpperLimit)
	birdWalking = false
}

if (birdState == "idle" && pauseCooldown <= 0 && birdWalking = false) {
	walkCooldown = random_range(walkTimeBottomLimit,walkTimeUpperLimit)
	
	t = random_range(0,2*pi)
	moveDirection_x = cos(t)
	moveDirection_y = sin(t)
	
	birdWalking = true
}

if (birdWalking == true) {
	if (!place_meeting(x + moveDirection_x*walkSpeed, y, oWallParent)) {
		x += moveDirection_x*walkSpeed
	}
if (!place_meeting(x, y + moveDirection_y*walkSpeed, oWallParent)) {
	}
		y += moveDirection_y*walkSpeed
	}

show_debug_message("New tick")
distanceToPlayer = sqrt(sqr(oPlayer.x-x)+sqr(oPlayer.y-y))

if (oPlayer.crouching == true) {
	attentionDistance = 15
}
else {
	attentionDistance = 50
}

if (distanceToPlayer < attentionDistance && birdState == "idle") {
	targetDetected = true
	t = random_range(0,2*pi)
	moveDirection_x = cos(t)
	moveDirection_y = sin(t)
	birdState = "awake"
	birdWalking = false
	show_debug_message("Bird detected player")
}

if (targetDetected == true) {
	x += moveDirection_x*flySpeed
	y += moveDirection_y*flySpeed
}

if (birdState = "awake") && (abs(x - oPlayer.x) > oCamera.view_size_x || abs(y-oPlayer.y) > oCamera.view_size_y) {
	instance_destroy(this_instance)
	show_debug_message("Bird with instance number " + string(this_instance) + " got destroyed")
}
}