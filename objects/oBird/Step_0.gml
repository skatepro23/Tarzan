with(this_instance) {

depth = -y;

//Executes idle movements depending on given paramaters in create event
if (state == "idle") {
	fEntityMovement()
	x += moveX
	y += moveY
}

//calculates distance to oPlayer and sets the birds attention accordingly
distanceToPlayer_x = oPlayer.x-x
distanceToPlayer_y = oPlayer.y-y
distanceToPlayer = sqrt(sqr(distanceToPlayer_x)+sqr(distanceToPlayer_y))

//oBird gets scared if player attacks to close
if (instance_exists(oNetCollider)) {
	distanceToNetCollider_x = oNetCollider.x-x
	distanceToNetCollider_y = oNetCollider.y-y
	distanceToNetCollider = sqrt(sqr(distanceToNetCollider_x)+sqr(distanceToNetCollider_y))
	//catch system
	if (place_meeting(x,y,oNetCollider)) {
		state = "catched"
		flySpeed = 0
		sprite_index = sBirdGotCatched
	}
}
		
if (state == "catched" && image_index >= image_number - 1) {
	instance_destroy(this_instance)
	global.catchedBirds += 1
}
	
else {
	distanceToNetCollider = infinity
}

if (oPlayer.crouching == true) {
	attentionDistance = 15
}
else {
	attentionDistance = 50
}

//If oPlayer is too close to oBird, bird will fly away
if (((distanceToNetCollider <= 50 )||(distanceToPlayer < attentionDistance)) && state == "idle") {
	targetDetected = true
	t = random_range(0,2*pi)
	moveDirection_x = cos(t)
	moveDirection_y = sin(t)
	state = "awake"
	walkingRightNow = false
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