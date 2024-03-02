extends Control

var life = 5
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func inscrease_score(sc):
	score += sc
	$Score.text = str(score)

func death():
	life -= 1
	if life == -1:
		%GameOver/Score.text = str(score)
		%GameOver.visible = true
		%GUI.visible = false
		%Playfield.visible = false
		return
	$Lives/Label.text = str(life)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
