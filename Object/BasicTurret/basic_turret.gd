extends Node3D
class_name BasicTurret

@onready var head: MeshInstance3D = %Head
@onready var detection_area: Area3D = %DetectionArea

var target : EnemyPathFollow = null

func _physics_process(delta: float) -> void:
	if target:
		head.look_at(target.global_position)
	else:
		head.rotation = Vector3.ZERO
		

func _on_update_target_timer_timeout() -> void:
	var bodies : Array[Node3D] = detection_area.get_overlapping_bodies()
	var shortest_distance : float = 10000000
	var nearest_enemy: Node3D = null
	
	for body in bodies:
		if body.owner.is_in_group("enemy"):
			var distance_to_enemy = global_position.distance_to(body.global_position)
			if distance_to_enemy < shortest_distance:
				shortest_distance = distance_to_enemy
				nearest_enemy = body.owner
				
	target = nearest_enemy
	
	if target:
		print(target.name + "is in range!")
