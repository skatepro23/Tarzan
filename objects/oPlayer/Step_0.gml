depth = -y;

moveX = 0;
moveY = 0;

// Set the movement speed
moveSpeed = moveSpeed_init

// Check if the "Shift" key is pressed
if (keyboard_check(vk_shift)){
    crouching = true;
	moveSpeed = moveSpeed_init/2
} else {
    crouching = false;
}

// Check for WASD key presses and update the moveX and moveY variables accordingly
if (keyboard_check(ord("W")) || keyboard_check(vk_up)) {
    moveY = -moveSpeed;
	moveDirection = "up"
} else if (keyboard_check(ord("S")) || keyboard_check(vk_down)) {
    moveY = moveSpeed;
	moveDirection = "down";
}

if (keyboard_check(ord("A")) || keyboard_check(vk_left)) {
    moveX = -moveSpeed;
	moveDirection = "left";
} else if (keyboard_check(ord("D")) || keyboard_check(vk_right)) {
    moveX = moveSpeed;
	moveDirection = "right";
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
	torch_equipped = true;
} else {
	torch_equipped = false;
}

//sprite system
if (moveDirection == "up") {
	if (crouching == false) {
		sprite_index = sPlayerBack
	}
	else {
		sprite_index = sPlayerCrouchBack
	}
}

if (moveDirection == "down") {
	if (crouching == false) {
		sprite_index = sPlayerRight
	}
	else {
		sprite_index = sPlayerCrouch
	}
}

if (moveDirection == "left") {
	if (crouching == false) {
		sprite_index = sPlayerLeft
	}
	else {
		sprite_index = sPlayerCrouch
	}
}

if (moveDirection == "right") {
	if (crouching == false) {
		sprite_index = sPlayerRight
	}
	else {
		sprite_index = sPlayerCrouch
	}
}

if (torch_equipped == true) {
	sprite_index = sPlayerFlame
}