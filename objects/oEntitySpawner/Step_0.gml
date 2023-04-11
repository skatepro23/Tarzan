herd = [oBird]

for (i = 0;i < array_length(herd);i++) {
objID = herd[i]
show_debug_message(objID)

with(objID) {
	objName = object_index
	show_debug_message(objName)
}


entityCount = instance_number(objName)


//show_debug_message("Entity MAX is: " + string(entityMax))

if (entityCount < entityMax) {
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
	
	//if (spawnPoint_x < frameBorder_left && spawnPoint_x > frameBorder_right && spawnPoint_y < frameBorder_top && spawnPoint_y > frameBorder_bottom) {
		instance_create_layer(spawnPoint_x,spawnPoint_y,"Overlay",objName)
	//}
	//show_debug_message("Created new instance: " + string(objName))
			
	}
}