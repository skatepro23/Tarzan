//last_instance = oBirdSpawner.last_instance

//show_debug_message("oBird id: "+string(id))

this_instance = id
entityMax = 12

with(this_instance) {
	//destroy if spawned on top of wall
	if (place_meeting(x,y,oWallParent)) {
		instance_destroy(this_instance)
	}
	
	//flying variables
	flySpeed = 1.5
	targetDetected = false
	state = "idle"
	
	//Initiates idle movement paramaters
	//constants
	walkSpeed = 0.2
	walkTimeBottomLimit = 10
	walkTimeUpperLimit = 100
	//variables
	pauseCooldown = 5
	walkCooldown = 0
	walkingRightNow = false
	state = "idle"
	currentPos_x = x
	currentPos_y = y
	moveX = 0
	moveY = 0
	
}