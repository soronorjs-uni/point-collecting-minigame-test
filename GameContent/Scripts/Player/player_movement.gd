extends CharacterBody2D

@export var SPEED := 300.0
@export var DASH_SPEED := 10000.0

var dash_tween: Tween
var dash_velocity := 0.0
var dashing = false
@export var dashing_available := true

@onready var animationPlayer = $AnimationPlayer

var trail_point_limit = 0

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	
	# Burst Velocity
	if Input.is_action_just_pressed("dash"):
		if dashing_available:
			trail_point_limit = 10
			$Camera2D.shake_strength = 15.0
			animationPlayer.current_animation = "dash"
			animationPlayer.play("dash")
			dash_velocity = DASH_SPEED
			if dash_tween:
				dash_tween.stop()
			dash_tween = create_tween()
			dash_tween.tween_property(self, "dash_velocity", 0, 0.3).set_ease(Tween.EASE_OUT)
			dashing_available = false

	if direction:
		if !animationPlayer.current_animation == "dash":
			animationPlayer.play("walk_loop")
			trail_point_limit = 0
		velocity.x = direction * (SPEED + dash_velocity)
	else:
		animationPlayer.stop()
		velocity.x = move_toward(velocity.x, 0.0, SPEED)
		
	display_trail()
	move_and_slide()
	
func powerup(powerupType: Enum.POWERUP):
	if powerupType == Enum.POWERUP.DASH:
		dashing_available = true
		GameController.powerup_dash.emit()
	else:
		pass

func display_trail():
	if $Line2D.points.size() >= trail_point_limit:
		$Line2D.remove_point(0)
	else:
		$Line2D.add_point(global_position)
