extends Node2D

@onready var LeftPaddle : CharacterBody2D = $LeftPaddle
@onready var RightPaddle : CharacterBody2D = $RightPaddle

const rotationAngle : float = -PI / 4
@export var rotationSpeed : float = 25.0

var left_bumper_default_rotation : float
var right_bumper_default_rotation : float

func _ready() -> void:
	left_bumper_default_rotation = LeftPaddle.rotation
	right_bumper_default_rotation = RightPaddle.rotation

func _rotate_to_angle(angle : float, paddle : CharacterBody2D):
	paddle.rotate(angle - paddle.rotation)

func _process(delta: float) -> void:
	if (Input.is_action_pressed("LeftBumper")):
		var nextRotationAngle = lerp(LeftPaddle.rotation, rotationAngle, delta * rotationSpeed)
		_rotate_to_angle(nextRotationAngle, LeftPaddle)
	else:
		var nextRotationAngle = lerp(LeftPaddle.rotation, left_bumper_default_rotation, delta * rotationSpeed)
		_rotate_to_angle(nextRotationAngle, LeftPaddle)
	if (Input.is_action_pressed("RightBumper")):
		var nextRotationAngle = lerp(RightPaddle.rotation, -rotationAngle, delta * rotationSpeed)
		_rotate_to_angle(nextRotationAngle, RightPaddle)
	else:
		var nextRotationAngle = lerp(RightPaddle.rotation, right_bumper_default_rotation, delta * rotationSpeed)
		_rotate_to_angle(nextRotationAngle, RightPaddle)
