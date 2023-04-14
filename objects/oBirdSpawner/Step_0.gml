birdCounter = instance_number(oBird)

if (birdCounter < 5) {
	spawnPoint = fEntitySpawn()
	
	instance_create_layer(spawnPoint[0],spawnPoint[1],"Overlay",oBird)
	
	show_debug_message("Spawned new oBird at " + "x: " + string(spawnPoint[0]) + "and y: " + string(spawnPoint[1]))
}