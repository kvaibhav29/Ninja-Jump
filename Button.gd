extends Button

var world = 'res://World.tscn'

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if self.pressed or Input.is_action_pressed("ui_accept"):
		get_tree().change_scene(world)
	pass
