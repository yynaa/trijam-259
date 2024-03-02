class_name Alive extends Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_overlapping_areas():
		var coll = get_overlapping_areas()
		for ca in coll:
			if ca.has_meta("is_bullet"):
				get_tree().current_scene.find_child("AudioStreamPlayer2").stop()
				get_tree().current_scene.find_child("AudioStreamPlayer2").play()
				if name == "Player":
					if get("invuln") == 0:
						get_tree().current_scene.find_child("ShaderController").add_circle(position)
						%Ui.death()
						set("invuln", 1)
					
					
				else:
					get_parent().objective -= 1
					queue_free()
					get_tree().current_scene.find_child("Ui").inscrease_score(100)
					get_tree().current_scene.find_child("ShaderController").add_circle(position)

				ca.queue_free()
				
				break
	
