extends Node2D

var platform = preload('res://Platform.tscn')
var player
var width
var y
var counter
var camera
var platforms 
var plats_array
var height

func _ready():
	set_physics_process(true)
	plats_array = []
	player = get_node("Player")
	camera = get_node('Camera2D')
	platforms = get_node('platforms')
	width = get_viewport().get_visible_rect().size.x
	height = get_viewport_rect().size.y
	randomize()
	y = 0
	
#	while y > -100000:
#		var new_platform = platform.instance()
#		new_platform.position.x = rand_range(-width/2, width/2)
#		new_platform.position.y = y
##		add_child(new_platform)
#		var plat = get_node("platforms")
#		add_child_below_node(plat, new_platform)
#		y -= rand_range(190,240)
#	pass
	
func _process(delta):
	player = get_node("Player")
	width = get_viewport().get_visible_rect().size.x
	randomize()
	if (player.get_colliding_bodies().size() > 0):
		var plat = player.get_colliding_bodies().front()
		plats_array.erase(plat)
		plat.queue_free()
		
	if (plats_array.size() > 0 && plats_array.front().position.y > camera.position.y + height/2):
		var plat = plats_array.front()
		plats_array.erase(plat)
		plat.queue_free()
	
#	print (str(plats_array.size()))
	
		
	if (int(player.position.y) % 1000 < 7 && int(player.position.y) % 1000 > -7):
		counter = y-1000
#		print (player.position.y)
		while (counter < y) :
			var new_platform = platform.instance()
			new_platform.position.x = rand_range(-width/2, width/2)
			new_platform.position.y = y
			plats_array.append(new_platform)
	#		add_child(new_platform)
			var plat = get_node("platforms")
			add_child_below_node(plat, new_platform)
			
			if y >= -5000:
#				print ("making 1")
				y -= rand_range(110,160)
			elif y < -5000 && y >= -10000:
#				print ("making 2")

				y -= rand_range(200, 240)
			elif y < -10000 && y >= -15000:
#				print ("making 3")
				y-= rand_range(240,300)
			else:
#				print ("making 4")
				y-= rand_range(260, 330)
	
		
#			y -= rand_range(190,240)
			
#			print ("generated" + str(new_platform.position.y))


