with(this_instance) {

depth = -y;

//Executes idle movements depending on given paramaters in create event
if (state == "idle") {
	struct_birdMovementData = fEntityMovement(struct_birdMovementData)
	pauseCooldown = struct_birdMovementData.pauseCooldown
	walkCooldown = struct_birdMovementData.walkCooldown
	birdWalking = struct_birdMovementData.birdWalking
	state = struct_birdMovementData.state

	x += struct_birdMovementData.moveX
	y += struct_birdMovementData.moveY
}

//calculates distance to oPlayer and sets the birds attention accordingly
distanceToPlayer_x = oPlayer.x-x
distanceToPlayer_y = oPlayer.y-y
distanceToPlayer = sqrt(sqr(distanceToPlayer_x)+sqr(distanceToPlayer_y))

if (oPlayer.crouching == true) {
	attentionDistance = 15
}
else {
	attentionDistance = 50
}

//catch system
if (place_meeting(x,y,oNetCollider)) {
	instance_destroy(this_instance)
}

//If oPlayer is too close to oBird, bird will fly away
if (distanceToPlayer < attentionDistance && state == "idle") {
	targetDetected = true
	t = random_range(0,2*pi)
	moveDirection_x = cos(t)
	moveDirection_y = sin(t)
	state = "awake"
	birdWalking = false
	show_debug_message("Bird detected player")
}

if (targetDetected == true) {
	x += moveDirection_x*flySpeed
	y += moveDirection_y*flySpeed
}

//if a fleeing bird gets too far from oPlayer it will despawn
if (state = "awake") && (abs(x - oPlayer.x) > oCamera.view_size_x || abs(y-oPlayer.y) > oCamera.view_size_y) {
	instance_destroy(this_instance)
	show_debug_message("Bird with instance number " + string(this_instance) + " got destroyed")
}
}