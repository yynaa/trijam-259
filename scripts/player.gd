extends Area2D

const SPEED = 1000.0
const FRICTION = 3.5

var velocity: Vector2 = Vector2.ZERO

func _process(delta):
	set_rotation(0)
	var lmp: Vector2 = get_local_mouse_position()
	set_rotation(atan2(lmp.y, lmp.x))
	
	#pos
	var a: Vector2 = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down")).normalized() * SPEED * delta
	
	velocity *= 1/(1+ FRICTION * delta)
	velocity += a
	
	position += velocity * delta
