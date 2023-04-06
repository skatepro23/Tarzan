function fEntityMovement(struct_EntityData){
//constants
walkSpeed = struct_EntityData.walkSpeed
walkTimeBottomLimit = struct_EntityData.walkTimeBottomLimit
walkTimeUpperLimit = struct_EntityData.walkTimeUpperLimit

//variables
pauseCooldown = struct_EntityData.pauseCooldown
walkCooldown = struct_EntityData.walkCooldown
birdWalking = struct_EntityData.birdWalking
state = struct_EntityData.state
currentPos_x = struct_EntityData.currentPos_x
currentPos_y = struct_EntityData.currentPos_y
	
pauseCooldown -= 1
walkCooldown -= 1

if (state == "idle" && walkCooldown <= 0 && birdWalking == true) {
	pauseCooldown = random_range(walkTimeBottomLimit,walkTimeUpperLimit)
	birdWalking = false
}

if (state == "idle" && pauseCooldown <= 0 && birdWalking = false) {
	walkCooldown = random_range(walkTimeBottomLimit,walkTimeUpperLimit)
	
	t = random_range(0,2*pi)
	moveDirection_x = cos(t)
	moveDirection_y = sin(t)
	
	birdWalking = true
}

if (birdWalking == true) {
	if (!place_meeting(x + moveDirection_x*walkSpeed, y, oWallParent)) {
		moveX = moveDirection_x*walkSpeed
	}
	else {
		moveX = 0
	}
	if (!place_meeting(x, y + moveDirection_y*walkSpeed, oWallParent)) {
		moveY = moveDirection_y*walkSpeed
	}
	else {
		moveY = 0
	}
}
else {
	moveX = 0
	moveY = 0
}

struct_EntityData.pauseCooldown = pauseCooldown
struct_EntityData.walkCooldown = walkCooldown
struct_EntityData.birdWalking = birdWalking
struct_EntityData.state = state
struct_EntityData.currentPos_x = currentPos_x
struct_EntityData.currentPos_y = currentPos_y
struct_EntityData.moveX = moveX
struct_EntityData.moveY = moveY

return(struct_EntityData)

}