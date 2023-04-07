//last_instance = oBirdSpawner.last_instance

//show_debug_message("oBird id: "+string(id))

this_instance = id

with(this_instance) {
	//destroy if spawned on top of wall
	if (place_meeting(x,y,oWallParent)) {
		instance_destroy(this_instance)
	}
	
	//flying variables
	flySpeed = 1.5
	targetDetected = false
	state = "idle"
	
	//constants and temporary values needed to use oEntitiesParent:s walking script
	//constants
	walkSpeed = 0.2
	walkTimeBottomLimit = 10
	walkTimeUpperLimit = 100
	//temporary values, necessary for initiating script
	pauseCooldown = 5
	walkCooldown = 0
	walkingRN = false
	state = "idle"
	currentPos_x = x
	currentPos_y = y
	moveX = 0
	moveY = 0
	
}