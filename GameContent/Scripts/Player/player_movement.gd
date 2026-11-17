extends CharacterBody2D

@export var SPEED := 300.0
@export var DASH_SPEED := 10000.0

var dash_tween: Tween
var dash_velocity := 0.0
var dashing = false
@export var dashing_available := true

@onready var animationPlayer = $AnimationPlayer
@onready var FX_animation = $FX
@onready var trail = $Trail

func _ready() -> void:
	animationPlayer.play("RESET")
	FX_animation.play("RESET")

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	
	# Burst Velocity
	if Input.is_action_just_pressed("dash") && direction:
		if dashing_available || GameController.inf_dash:
			trail.trail_point_limit = 10
			GameController.cam_shake.emit(8, 0.1)
			animationPlayer.current_animation = "dash"
			animationPlayer.play("dash")
			FX_animation.play("electricity", -1, -1, true)
			dash_velocity = DASH_SPEED
			if dash_tween:
				dash_tween.stop()
			dash_tween = create_tween()
			dash_tween.tween_property(self, "dash_velocity", 0, 0.3).set_ease(Tween.EASE_OUT)
			dashing_available = false

	if direction:
		if !animationPlayer.current_animation == "dash":
			animationPlayer.play("walk_loop")
			trail.trail_point_limit = 0
		velocity.x = direction * (SPEED + dash_velocity)
	else:
		animationPlayer.stop()
		velocity.x = move_toward(velocity.x, 0.0, SPEED)
		
	trail.display_trail()
	move_and_slide()
	
func powerup(powerupType: Enum.POWERUP):
	if powerupType == Enum.POWERUP.DASH:
		if !dashing_available:
			dashing_available = true
			FX_animation.play("electricity")
	else:
		pass
