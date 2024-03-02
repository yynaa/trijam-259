extends Alive

const SPEED = 60.0
const SHOOT_SPEED = 0.5
var shoot_timer = SHOOT_SPEED

@onready var p: Node2D = get_parent().find_child("Player")

var bullet_template: Resource = preload("res://objects/bullet.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	
	if is_instance_valid(p):
		rotation = atan2(p.position.y - position.y, p.position.x - position.x)
		position += Vector2.from_angle(rotation) * SPEED * delta
		
		#shoot_timer -= delta
		#if shoot_timer <= 0:
			#var nb = bullet_template.instantiate()
			#nb.position = position
			#nb.rotation = rotation
			#nb.SPEED = 600.0
			#get_parent().add_child(nb)
			#shoot_timer = SHOOT_SPEED
