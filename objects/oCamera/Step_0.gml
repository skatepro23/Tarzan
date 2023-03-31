// Calculate the new camera position using lerp
new_x = lerp(camera_get_view_x(camera), target.x - (camera_get_view_width(camera) / 2), lerp_speed);
new_y = lerp(camera_get_view_y(camera), target.y - (camera_get_view_height(camera) / 2), lerp_speed);

// Set the new camera position
camera_set_view_pos(camera, new_x, new_y);
