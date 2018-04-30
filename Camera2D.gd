extends Camera2D

export(NodePath) var player_path
var player
var text
var score
var platform = preload('res://Platform.tscn')

func _ready():
	set_physics_process(true)
	player = get_node(player_path)
	pass


func _process(delta):
	var player_y = player.position.y
	if player_y < self.position.y:
		self.move_local_y(-20)

	text = get_node('../Text/RichTextLabel')
	
	
	align()

	score = str(self.position.y/-2)
	if (self.position.y/-2 == -0):
		score = str(0)
	text.set_text(score)
	global.score2 = score
	pass