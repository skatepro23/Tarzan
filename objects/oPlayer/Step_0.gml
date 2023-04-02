depth = -y;

// Set the movement speed
moveSpeed = moveSpeed_init
speedScale = 0
add2Pos_x = 0
add2Pos_y = 0

// Check if the "Shift" key is pressed
if (keyboard_check(vk_shift)){
    crouching = true;
	moveSpeed = moveSpeed_init/2
} else {
    crouching = false;
}

// Check for WASD key presses and update the moveX and moveY variables accordingly
if (keyboard_check(ord("W")) || keyboard_check(vk_up)) {
	add2Pos_y = -1
	moveDirection = "up"
} else if (keyboard_check(ord("S")) || keyboard_check(vk_down)) {
	add2Pos_y = 1
	moveDirection = "down";
}

if (keyboard_check(ord("A")) || keyboard_check(vk_left)) {
	add2Pos_x = -1
	moveDirection = "left";
} else if (keyboard_check(ord("D")) || keyboard_check(vk_right)) {
	add2Pos_x = 1
	moveDirection = "right";
}

if (add2Pos_x == 0 && add2Pos_y == 0) {
	speedScale = 0
}
else {
	speedScale = 1/sqrt(sqr(add2Pos_x)+sqr(add2Pos_y)) //om spelaren rör sig diagonalt är speedScale = 1/sqrt(2) vilket gör att spelaren går lika snabbt diagonalt
}

moveX = add2Pos_x*moveSpeed*speedScale
moveY = add2Pos_y*moveSpeed*speedScale

// Check for horizontal collisions with oWall
if (!place_meeting(x + moveX, y, oWallParent)) {
    x += moveX;
}
if (!place_meeting(x, y + moveY, oWallParent)) {
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