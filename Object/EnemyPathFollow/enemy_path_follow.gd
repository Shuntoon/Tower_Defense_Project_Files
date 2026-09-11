extends PathFollow3D
class_name EnemyPathFollow

@export var speed : float = 5.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if progress_ratio != 1.0:
		progress_ratio += (speed * .01) * delta
	else:
		print("enemy attacked the base!")
		queue_free()
