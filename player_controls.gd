extends Node2D

@onready var LeftPaddle : CharacterBody2D = $LeftPaddle
@onready var RightPaddle : CharacterBody2D = $RightPaddle

const rotationAngle : float = -PI / 4
@export var rotationSpeed : float = 40.0

var left_bumper_default_rotation : float
var right_bumper_default_rotation : float

func _process(delta: float) -> void:
	if (Input.is_action_pressed("LeftBumper")):
		var nextRotationAngle = lerp(LeftPaddle.rotation, rotationAngle, delta * rotationSpeed)
		LeftPaddle.rotation = nextRotationAngle
	else:
		var nextRotationAngle = lerp(LeftPaddle.rotation, 0.0, delta * rotationSpeed)
		LeftPaddle.rotation = nextRotationAngle
	#if (Input.is_action_pressed("RightBumper")):
