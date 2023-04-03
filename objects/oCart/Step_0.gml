// If the cart is moving, move along the rail
if (moving) {
    // Move the cart
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);
    
    // Check for rail objects (e.g., oRailHorizontal, oRailVertical)
    var rail_obj = instance_place(x, y, oRailParent);

    // If the cart is on a rail object
    if (rail_obj) {
        // Calculate the new direction based on the rail object's type
        if (rail_obj.object_index == oRailHoriz) {
            direction = 0; // Moving right
            // If you want to allow moving left, uncomment the following lines:
            // if (speed < 0) {
            //     direction = 180; // Moving left
            // }
        } else if (rail_obj.object_index == oRailVert) {
            direction = 90; // Moving down
            // If you want to allow moving up, uncomment the following lines:
            // if (speed < 0) {
            //     direction = 270; // Moving up
            // }
        }
    }
}
