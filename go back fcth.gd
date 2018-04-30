extends Button

# class member variables go here, for example:
# var a = 2

var world = 'res://splash.tscn'

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if self.pressed or Input.is_action_pressed("ui_accept"):
		get_tree().change_scene(world)
	pass