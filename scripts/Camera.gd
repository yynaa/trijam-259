extends Camera2D

@onready var p: Node2D = get_parent().find_child("Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = p.position
