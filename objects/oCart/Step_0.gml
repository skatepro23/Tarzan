depth = -y;

// Check if the player is colliding with the cart and pressing the "E" key
if (place_meeting(x, y, oPlayer) && keyboard_check_pressed(ord("E")) && moving == false) {
    activated = true; // Toggle the cart's activated state
	
	// Finds a place on the path that is close to the cart and starts the cart from there
	distanceToPathPos_new = infinity
	for (i = 0; i <= 1; i += 0.01) {
		pathPos_x = path_get_x(pRail,i)
		pathPos_y = path_get_y(pRail,i)
		distanceToPathPos = sqrt(sqr(pathPos_x-x)+sqr(pathPos_y-y))
		if (distanceToPathPos < distanceToPathPos_new) {
			distanceToPathPos_new = distanceToPathPos
			pathPos_nearest = i
		}
		show_debug_message(pathPos_nearest)
	}
	
	// Finds the closest point on the path to the player
	distanceToPathPlayer_new = infinity
	for (i = 0; i <= 1; i += 0.01) {
		pathPos_x = path_get_x(pRail,i)
		pathPos_y = path_get_y(pRail,i)
		distanceToPathPlayer = sqrt(sqr(pathPos_x-oPlayer.x)+sqr(pathPos_y-oPlayer.y))
		if (distanceToPathPlayer < distanceToPathPlayer_new) {
			distanceToPathPlayer_new = distanceToPathPlayer
			pathPosPlayer_nearest = i
		}
		show_debug_message(pathPosPlayer_nearest)
	}
	
	// The cart will be "pushed" by the player in the opposite direction of the players relative position on the track
	if (pathPosPlayer_nearest < pathPos_nearest) {
		moveSpeed = initSpeed
		retardationSpeed = initRetardationSpeed
	}
	else {
		moveSpeed = -initSpeed
		retardationSpeed = -initRetardationSpeed
	}
}
	

// If the cart is activated, start following the path
if (activated && !moving) {
    path_start(pRail, moveSpeed, path_action_stop, true);
	path_position = pathPos_nearest
	moving = true
	  
}

if (activated && moving) {
	path_speed -= retardationSpeed
	if (abs(path_speed) <= 0.1) {
		path_end()
		moving = false
		activated = false
	}
}

if (place_meeting(x, y, oNetCollider)) {
	instance_destroy(id)
}
