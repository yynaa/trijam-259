class_name Alive extends Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_overlapping_areas():
		var coll = get_overlapping_areas()
		for ca in coll:
			if ca.name == "Bullet":
				queue_free()
				ca.queue_free()
	
