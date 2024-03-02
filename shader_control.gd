extends Polygon2D

const MAX_LENGTH = 128

var ttime = 0.
var circles = []
var times = []

# Called when the node enters the scene tree for the first time.
func _ready():
	add_circle(Vector2(25,25))
	add_circle(Vector2(100,100))


func add_circle(pos):
	if len(circles) >= 128:
		circles.pop_front()
		times.pop_front()
	circles.push_back(pos)
	times.push_back(ttime)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ttime += delta
	material.set_shader_parameter("ttime", ttime)
	material.set_shader_parameter("centers", circles)
	material.set_shader_parameter("times", times)
	material.set_shader_parameter("amount", len(circles))
	
