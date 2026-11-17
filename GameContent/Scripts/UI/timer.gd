extends Label

@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)

func _process(delta: float) -> void:
	var time: float = timer.time_left
	var seconds: int = int(time)
	var msec: int = int((time - seconds) * 1000)

	$".".text = "%02d:%03d" % [seconds, msec]
	
	if $Timer.time_left < 7.0:
		GameController.spawn_delay = 0.3

func _on_timer_timeout() -> void:
	$".".text = "Time Out!"
	GameController.game_over.emit()
