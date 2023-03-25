// Calculate the view center
var view_w_half = view_w * 0.5;
var view_h_half = view_h * 0.5;

// Update the camera's position to follow the target
var target_x = target.x - view_w_half;
var target_y = target.y - view_h_half;

distance_x = abs(target.x - camera_get_view_x(camera))
distance_y = abs(target.y - camera_get_view_y(camera))

if (distance_x > 50 || distance_y > 50)
{
	camera_set_view_pos(camera, target_x, target_y);
}