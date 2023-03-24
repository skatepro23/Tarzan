depth = -y;
var moveX = 0;
var moveY = 0;

// Set the movement speed
var moveSpeed = 4;

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
if (!place_meeting(x + moveX, y, oWall)) {
    x += moveX;
}

// Check for vertical collisions with oWall
if (!place_meeting(x, y + moveY, oWall)) {
    y += moveY;
}
// Check if the "Shift" key is pressed
if (keyboard_check(vk_shift)) {
    crouching = true;
} else {
    crouching = false;
}
if (crouching) {
    sprite_index = sPlayerCrouch;
	moveSpeed = moveSpeed/2;
} else {
    sprite_index = sPlayerRight; // Replace spr_Player with your standing or walking sprite
}
