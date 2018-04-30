extends Button

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if self.pressed:
		global.save(0)
		var texto = get_node("../RichTextLabel")
		texto.text = "High score: 0"
	pass