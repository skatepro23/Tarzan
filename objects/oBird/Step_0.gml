with(this_instance) {

depth = -y;

distanceToPlayer = sqrt(sqr(oPlayer.x-x)+sqr(oPlayer.y-y))

//show_debug_message("Distance to player: " + string(distanceToPlayer) + " pixels")

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
	show_debug_message("Bird detected player")
}

if (targetDetected == true) {
	x += moveDirection_x
	y += moveDirection_y
}

if (birdState = "awake") && (abs(x - oPlayer.x) > oCamera.view_size_x || abs(y-oPlayer.y) > oCamera.view_size_y) {
	instance_destroy(this_instance)
	show_debug_message(string(this_instance)+" got destroyed")
}

//show_debug_message(string(this_instance)+" is "+birdState)
}