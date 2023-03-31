depth = -y;

moveX = 0;
moveY = 0;

// Set the movement speed
moveSpeed = moveSpeed_init

// Check if the "Shift" key is pressed
if (keyboard_check(vk_shift)){
    crouching = true;
} else {
    crouching = false;
}
if (crouching) {
    sprite_index = sPlayerCrouch;
	moveSpeed = moveSpeed_init/2
	show_debug_message("crouching")
} else {
    sprite_index = sPlayerRight; // Replace spr_Player with your standing or walking sprite
	show_debug_message("not crouching")
}

// Check for WASD key presses and update the moveX and moveY variables accordingly
if (keyboard_check(ord("W")) || keyboard_check(vk_up)) {
    moveY = -moveSpeed;
} else if (keyboard_check(ord("S")) || keyboard_check(vk_down)) {
    moveY = moveSpeed;
}

if (keyboard_check(ord("A")) || keyboard_check(vk_left)) {
    moveX = -moveSpeed;
} else if (keyboard_check(ord("D")) || keyboard_check(vk_right)) {
    moveX = moveSpeed;
}

// Check for horizontal collisions with oWall
if (!place_meeting(x + moveX, y, oWallParent)) {
    x += moveX;
}
// Check for horizontal collisions with oWall
if (!place_meeting(y + moveY, x, oWallParent)) {
    y += moveY;
}

if (mouse_check_button(mb_left)){
	equipped = true;
} else {
	equipped = false;
}
if (equipped) {
	sprite_index = sPlayerFlame;
} else {
	sprite_index = sprite_index
}