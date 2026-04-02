extends Node

@onready var pinball : BasePinball = $InitialBall
var score : int

func _ready() -> void:
	pinball.reset_position = pinball.position

func _reset_round():
	pinball.reset_state = true

func _add_points(points : int):
	score += points

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("Reset")):
		print("Reset")
		_reset_round()
