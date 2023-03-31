// oCamera Step Event

// Check if the target exists
if (instance_exists(target)) {
    // Calculate the new camera position using lerp
    var new_x = lerp(camera_get_view_x(view), target.x - (camera_get_view_width(view) / 2), lerp_speed);
    var new_y = lerp(camera_get_view_y(view), target.y - (camera_get_view_height(view) / 2), lerp_speed);

    // Set the new camera position
    camera_set_view_pos(view, new_x, new_y);
}
