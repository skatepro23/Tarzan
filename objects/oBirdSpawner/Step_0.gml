birdCounter = instance_number(oBird)
maxCountBirds = 5

if (birdCounter < maxCountBirds)
	instance_create_layer(random_range(0,640),random_range(0,320),"Instances_1",oBird)