extends Node2D

var wave: int = 0

var objective: int = 0

var e1 = preload("res://objects/enemy_1.tscn")
var e2 = preload("res://objects/enemy_2.tscn")
var el = [e1, e2]

var p

func start_wave():
	wave += 1
	get_tree().current_scene.find_child("Bombs").find_child("Label").text = str(wave)
	objective = wave * 4
	
	for i in range(objective):
		var ne = el.pick_random().instantiate() as Alive
		ne.position = Vector2(randf_range(0, 24*64), randf_range(0, 24*64))
		while (ne.position - p.position).length() < 300:
			ne.position = Vector2(randf_range(0, 24*64), randf_range(0, 24*64))
		add_child(ne)

func _ready():
	p = find_child("Player")
	start_wave()

func _process(_delta):
	if objective <= 0:
		start_wave()

