// Check if the player is colliding with the cart and pressing the "E" key
if (instance_place(x, y, oPlayer) && keyboard_check_pressed(ord("E"))) {
    activated = !activated; // Toggle the cart's activated state
    moving = activated; // Update the moving state based on the activated state
}

// If the cart is activated, start following the path
if (activated) {
    if (!path_exists(pRail)) {
        show_error("Path 'pRail' not found", true);
    }
    if (!path_position) {
        path_start(pRail, path_speed, path_action_stop, true);
    }
    
    // Update the path speed based on the moving state
    path_speed = moving ? 4 : 0;
}
