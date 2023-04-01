distanceToPlayer = sqrt(sqr(oPlayer.x-oBird.x)+sqr(oPlayer.y-oBird.y))

show_debug_message("Distance to player: " + string(distanceToPlayer) + " pixels")

if (distanceToPlayer < 50 && birdState == "idle") {
	targetDetected = true
	moveDirection_x = random_range(-10,10)
	moveDirection_y = random_range(-10,10)
	birdState = "alerted"
	show_debug_message("Bird detected player")
}

if (targetDetected == true) {
	x += moveDirection_x
	y += moveDirection_y
}