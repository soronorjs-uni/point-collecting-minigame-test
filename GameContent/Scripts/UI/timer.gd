extends Label

var total_time = GameController.current_time
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)

func _process(delta: float) -> void:
	var time: float = timer.time_left
	var seconds: int = int(time)
	var msec: int = int((time - seconds) * 1000)

	$".".text = "%02d:%03d" % [seconds, msec]

func _on_timer_timeout() -> void:
	pass
