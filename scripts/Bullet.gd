extends Area2D

var is_player_bullet: bool = false

var SPEED: float = 500.0

func _ready():
	if is_player_bullet:
		set_collision_layer_value(1, false)
		set_collision_mask_value(1, false)
		set_collision_layer_value(2, true)
		set_collision_mask_value(2, true)
		find_child("Polygon").color = "#FFF"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += SPEED * delta * Vector2.from_angle(rotation)
	
	if (position.x < -100 or position.x > 64*24+100 or position.y < -100 or position.y > 64*24+100):
		
