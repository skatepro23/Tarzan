function fEntitySpawn(){
	spawnRange = 100
	
	frameBorder_left = oCamera.x-oCamera.view_size_x/2
	frameBorder_right = oCamera.x+oCamera.view_size_x/2
	frameBorder_top = oCamera.y-oCamera.view_size_y/2
	frameBorder_bottom = oCamera.y+oCamera.view_size_y/2
	
	xLimit_left = frameBorder_left-spawnRange
	xLimit_right = frameBorder_right+spawnRange
	yLimit_top = frameBorder_top-spawnRange
	yLimit_bottom = frameBorder_bottom+spawnRange
	
	spawnPoint_x = random_range(xLimit_left,xLimit_right)
	spawnPoint_y = random_range(yLimit_top,yLimit_bottom)
	
	spawnPoint = [spawnPoint_x,spawnPoint_y]
	
	return spawnPoint

	show_debug_message("Created new instance: ")
}