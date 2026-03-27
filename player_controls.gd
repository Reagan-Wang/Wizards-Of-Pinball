extends Node2D

@onready var LeftPaddle : CharacterBody2D = $LeftPaddle
@onready var RightPaddle : CharacterBody2D = $RightPaddle

const rotationAngle : float = -PI / 4
@export var rotationSpeed : float = 40.0

var left_bumper_default_rotation : float
var right_bumper_default_rotation : float

func _ready() -> void:
	left_bumper_default_rotation = LeftPaddle.rotation
	right_bumper_default_rotation = RightPaddle.rotation

func _process(delta: float) -> void:
	if (Input.is_action_pressed("LeftBumper")):
		var nextRotationAngle = lerp(LeftPaddle.rotation, rotationAngle, delta * rotationSpeed)
		LeftPaddle.rotation = nextRotationAngle
	else:
		var nextRotationAngle = lerp(LeftPaddle.rotation, left_bumper_default_rotation, delta * rotationSpeed)
		LeftPaddle.rotation = nextRotationAngle
	if (Input.is_action_pressed("RightBumper")):
		var nextRotationAngle = lerp(RightPaddle.rotation, -rotationAngle, delta * rotationSpeed)
		RightPaddle.rotation = nextRotationAngle
	else:
		var nextRotationAngle = lerp(RightPaddle.rotation, right_bumper_default_rotation, delta * rotationSpeed)
		RightPaddle.rotation = nextRotationAngle
