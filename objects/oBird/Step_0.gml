depth = -y;

distanceToPlayer = sqrt(sqr(oPlayer.x-oBird.x)+sqr(oPlayer.y-oBird.y))

show_debug_message("Distance to player: " + string(distanceToPlayer) + " pixels")

if (distanceToPlayer < 50 && birdState == "idle") {
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