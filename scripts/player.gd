extends Alive

const SPEED = 1000.0
const FRICTION = 3.5

const HOLD_SHOOT_SPEED: float = 0.2
const MASH_SHOOT_SPEED: float = 0.05

var shoot_timer: float = -1

var velocity: Vector2 = Vector2.ZERO

var bullet_template: Resource = preload("res://objects/bullet.tscn")

func _process(delta):
	super(delta)
	
	set_rotation(0)
	var lmp: Vector2 = get_local_mouse_position()
	set_rotation(atan2(lmp.y, lmp.x))
	
	#pos
	var a: Vector2 = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down")).normalized() * SPEED * delta
	
	velocity *= 1/(1+ FRICTION * delta)
	velocity += a
	
	position += velocity * delta
	
	position = position.clamp(Vector2(0,0), Vector2(64*24,64*24))
	
	shoot_timer -= delta
	if Input.is_action_pressed("Shoot") and shoot_timer <= 0:
		var nb = bullet_template.instantiate()
		nb.position = position
		nb.is_player_bullet = true
		nb.rotation = rotation
		nb.SPEED = 500.0
		get_parent().add_child(nb)
		shoot_timer = HOLD_SHOOT_SPEED
	
	if Input.is_action_just_released("Shoot") and shoot_timer > 0:
		shoot_timer = min(shoot_timer, MASH_SHOOT_SPEED)
