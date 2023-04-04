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
	birdState = "idle"
	
	//walking variables
	walkSpeed = 0.2
	pauseCooldown = 5
	walkCooldown = 0
	birdWalking = false
	walkTimeBottomLimit = 10
	walkTimeUpperLimit = 100
	
}