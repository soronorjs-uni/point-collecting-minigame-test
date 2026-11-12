extends Node2D

@export var required_score: int = 10

@onready var HUD = %Player.get_node("HUD")
@onready var Score = HUD.get_node("MainGrid/Score")

func _ready() -> void:
	Score.display_score(GameController.current_score, required_score)
