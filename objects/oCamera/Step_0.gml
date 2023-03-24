// Calculate the view center
var view_w_half = view_w * 0.5;
var view_h_half = view_h * 0.5;

// Update the camera's position to follow the target
var target_x = target.x - view_w_half;
var target_y = target.y - view_h_half;

if (target_x > 1)  (target_y > 1)
{
	move_towards_point(target_x, target_y,5);
}