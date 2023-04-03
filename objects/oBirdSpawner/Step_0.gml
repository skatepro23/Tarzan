birdCounter = instance_number(oBird)
maxCountBirds = 5

show_debug_message(string(birdCounter))

if (birdCounter < maxCountBirds)
	instance_create_layer(random_range(0,640),random_range(0,320),"Instances_1",oBird)