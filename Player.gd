extends RigidBody2D

export(NodePath) var camera_path
var camera
var world

var width
var height

var speed = 350
var jump_speed = 600

func _ready():
	set_physics_process(true)
	camera = get_node('../Camera2D')
	width = get_viewport_rect().size.x
	height = get_viewport_rect().size.y
	contact_monitor = true
	contacts_reported = 5
#	print (width)
	pass
	
func _physics_process(delta):
	var left_key = Input.is_action_pressed("ui_left")
	var right_key = Input.is_action_pressed("ui_right")
	
	if left_key:
		linear_velocity = (Vector2(-speed,linear_velocity.y))
		get_node("Sprite").flip_h = true
	if right_key:
		linear_velocity = (Vector2(speed,linear_velocity.y))
		get_node("Sprite").flip_h = false
		
	
	if !left_key and !right_key:
		linear_velocity = (Vector2(0, linear_velocity.y))

	if (get_colliding_bodies().size() > 0):
		linear_velocity = (Vector2(0, -jump_speed))
		
	if self.position.y > camera.position.y + height/2:
		get_tree().change_scene("res://death.tscn");
		
		
	if self.position.y < -2500 && self.position.y >= -5000 && jump_speed == 600:
		self.jump_speed = 700
		self.speed = 500
	#elif self.position.y < -5000 && self.position.y >= -10000 && jump_speed == 700:
	#	self.jump_speed = 800
	#	self.speed = 650

	#elif self.position.y < -10000 && self.position.y >= -15000 && jump_speed == 800:
	#	self.jump_speed = 900
	#	self.speed = 800
	#elif self.position.y < -15000 && jump_speed == 900:
	#	self.jump_speed = 1000
	#	self.speed = 1000
		
	if self.position.x > width/2 && self.linear_velocity.x > 0:
		self.linear_velocity.x = 0
		
	if self.position.x < -width/2 && self.linear_velocity.x < 0:
		self.linear_velocity.x = 0
	
	pass
	
	
	