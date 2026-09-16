extends Node
class_name WaveManager

@onready var wave_timer: Timer = $WaveTimer
@onready var enemy_path: Path3D = $"../EnemyPath"

@export var wave_index : int = 1

var time_between_enemy_spawns : float = .4

const ENEMY_PATH_FOLLOW = preload("uid://q6qa276yvsvv")

func _enter_tree() -> void:
	add_to_group("wave_manager")

func _on_wave_timer_timeout() -> void:
	for i in range(wave_index):
		var enemy_path_follow_inst = ENEMY_PATH_FOLLOW.instantiate()
		enemy_path.add_child(enemy_path_follow_inst)
		await get_tree().create_timer(time_between_enemy_spawns).timeout
		
	wave_index += 1
