depth = -y;

// Check if the player is colliding with the cart and pressing the "E" key
if (place_meeting(x, y, oPlayer) && keyboard_check_pressed(ord("E")) && moving == false) {
    activated = true; // Toggle the cart's activated state

	distanceToPathPos_new = infinity
	for (var i = 0; i <= 1; i += 0.01) {
		pathPos_x = path_get_point_x(pRail,i)
		pathPos_y = path_get_point_y(pRail,i)
		distanceToPathPos = sqrt(sqr(pathPos_x-x)+sqr(pathPos_y-y))
		if (distanceToPathPos < distanceToPathPos_new) {
			distanceToPathPos_new = distanceToPathPos
			pathPos_nearest = i
		}
	}	
}


// If the cart is activated, start following the path
if (activated && moving == false) {
      path_start(pRail, pathSpeed, path_action_reverse, true);
	  path_position = pathPos_nearest
	  moving = true
}

if (place_meeting(x, y, oNetCollider)) {
	instance_destroy(id)
}
