extends Camera2D

var shake_intensity: float
var active_shake_time: float

@export var shake_decay: float = 5.0

var shake_time: float
@export var shake_time_speed: float = 20.0

var lerp_weight: float = 10.5

var noise = FastNoiseLite.new()

@export var max_roll = deg_to_rad(0.05)

func _ready() -> void:
	GameController.cam_shake.connect(cam_shake)
	randomize()

func _physics_process(delta: float) -> void:
	if active_shake_time > 0:
		shake_time += shake_time_speed * delta
		active_shake_time -= delta
		
		offset = Vector2(
			noise.get_noise_2d(shake_time, 0) * shake_intensity, 
			noise.get_noise_2d(0, shake_time) * shake_intensity
		)
		
		rotation = max_roll * shake_intensity * noise.get_noise_1d(shake_time) * shake_intensity

		shake_intensity = max(shake_intensity - shake_decay * delta, 0)
	else:
		offset = lerp(offset, Vector2.ZERO, lerp_weight * delta)
		rotation = lerp(rotation, 0.0, lerp_weight * delta)
	
func cam_shake(intensity: int, time: float):
	noise.seed = randi()
	noise.frequency = 8.0
	
	shake_intensity = intensity
	active_shake_time = time
	shake_time = 0.0
