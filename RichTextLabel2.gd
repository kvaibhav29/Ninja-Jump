extends RichTextLabel

var score = 0


func _ready():
	var score = global.read_savegame()
	if int(global.score2) > int(score):
		global.save(global.score2)
	self.text = "High score: " + global.read_savegame()
#	self.text = "Your score: " + score
	
	
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
