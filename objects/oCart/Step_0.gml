depth = -y;

// Check if the player is colliding with the cart and pressing the "E" key
if (place_meeting(x, y, oPlayer) && keyboard_check_pressed(ord("E")) && moving == false) {
    activated = true; // Toggle the cart's activated state
	moveSpeed = initSpeed
	
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
}


// If the cart is activated, start following the path
if (activated && !moving) {
      path_start(pRail, moveSpeed, path_action_reverse, true);
	  path_position = pathPos_nearest
	  moving = true
}

if (activated && moving) {
	path_speed -= 0.01
	if (path_speed <= 0) {
		path_end()
		moving = false
		activated = false
	}
}

if (place_meeting(x, y, oNetCollider)) {
	instance_destroy(id)
}
