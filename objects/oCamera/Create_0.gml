camera = view_camera[0];

// Set the target to follow (oPlayer)
target = oPlayer;

// lerp_speed ändrar hur snabbt kameran rör sig mot spelaren
lerp_speed = 0.2;

// ändra view_size för att ändra hur inzoomad kameran är
view_size_x = 640;
view_size_y = 360;
camera_set_view_size(camera,view_size_x,view_size_y)
