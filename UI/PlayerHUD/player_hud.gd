extends Control

@onready var wave_timer_label: Label = %WaveTimerLabel
@onready var wave_timer: Timer = %WaveTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if wave_timer:
		wave_timer_label.text = "%0.0f" % wave_timer.time_left
