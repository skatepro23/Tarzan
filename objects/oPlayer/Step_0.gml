depth = -y;

// Set the movement speed
moveDirection = "idle"
moveSpeed = moveSpeed_init
speedScale = 0
add2Pos_x = 0
add2Pos_y = 0


if (keyboard_check(ord("W"))) {
  y -= 1
}
// Check for WASD key presses and update the moveX and moveY variables accordingly
if (keyboard_check(ord("W")) || keyboard_check(vk_up)) {
	add2Pos_y = -1
	moveDirection = "up"
	lastDirection = moveDirection
} else if (keyboard_check(ord("S")) || keyboard_check(vk_down)) {
	add2Pos_y = 1
	moveDirection = "down";
	lastDirection = moveDirection
}

if (keyboard_check(ord("A")) || keyboard_check(vk_left)) {
	add2Pos_x = -1
	moveDirection = "left";
	lastDirection = moveDirection
	lastDirection_x = "left"
} else if (keyboard_check(ord("D")) || keyboard_check(vk_right)) {
	add2Pos_x = 1
	moveDirection = "right";
	lastDirection = moveDirection
	lastDirection_x = "right"
}

if (add2Pos_x == 0 && add2Pos_y == 0) {
	speedScale = 0
}
else {
	speedScale = 1/sqrt(sqr(add2Pos_x)+sqr(add2Pos_y)) //om spelaren rör sig diagonalt är speedScale = 1/sqrt(2) vilket gör att spelaren går lika snabbt diagonalt
}

// Check if the "Shift" key is pressed
if (keyboard_check(vk_shift)){
    crouching = true;
	moveSpeed = moveSpeed_init/2
} else {
    crouching = false;
}

if (attacking == true) {
	moveSpeed = 0
	attackCooldown -= 1
	show_debug_message("Attacking")
	
	if (attackCooldown <= 0) {
		attacking = false
		instance_destroy(oNetCollider)
		show_debug_message("Stopped attacking")
	}
}

if (keyboard_check(vk_space) && attacking == false) {
	attacking = true
	moveSpeed = 0
	attackCooldown = 50
	
	if (keyboard_check(vk_space)) {
		if (lastDirection == "left") {
			instance_create_layer(x-attackReach,y,"Instances",oNetCollider)
		}
		else if (lastDirection == "right") {
			instance_create_layer(x+attackReach,y,"Instances",oNetCollider)
		}
		else if (lastDirection == "up") {
			instance_create_layer(x,y-attackReach,"Instances",oNetCollider)
		}
		else if (lastDirection == "down") {
			instance_create_layer(x,y+attackReach-15,"Instances",oNetCollider)
		}
	}
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
	image_speed = 1
	if (crouching == false) {
		sprite_index = sPlayerBack
	}
	else {
		sprite_index = sPlayerCrouchBack
	}
}

if (moveDirection == "down") {
	image_speed = 1
	if (crouching == false) {
		if lastDirection_x == "left" {
			sprite_index = sPlayerLeft
		}
		else {
			sprite_index = sPlayerRight
		}
	}
	else {
		sprite_index = sPlayerCrouch
	}
}

if (moveDirection == "left") {
	image_speed = 1
	if (crouching == false) {
		sprite_index = sPlayerLeft
	}
	else {
		sprite_index = sPlayerCrouch
	}
}

if (moveDirection == "right") {
	image_speed = 1
	if (crouching == false) {
		sprite_index = sPlayerRight
	}
	else {
		sprite_index = sPlayerCrouch
	}
}
if (moveDirection == "idle" && image_index >= image_number - 2) {
	image_index = 0
	image_speed = 0
}

if (torch_equipped == true) {
	sprite_index = sPlayerFlame
}

//Lägg in sprites till sPlayerAttack_up, sPlayerAttack_down osv, eventuellt också diagonalt
/*
if (attacking == true) {
	if moveDirection == "up" {
		sprite_index = sPlayerAttack_up
	}
	else if moveDirection == "down" {
		sprite_index = sPlayerAttack_down
	}
	else if moveDirection == "up" {
		sprite_index = sPlayerAttack_left
	}
	else if moveDirection == "up" {
		sprite_index = sPlayerAttack_right
	}
}
*/

show_debug_message(moveDirection)