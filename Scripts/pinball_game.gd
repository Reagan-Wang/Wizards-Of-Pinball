extends Node

@onready var pinball : BasePinball = $InitialBall
var score : int

var board_state : BOARD_STATE

enum BOARD_STATE 
{
	PLAYING,
	BUYING,
	PAUSED
}

func _ready() -> void:
	pinball.reset_position = pinball.position
	SignalBus.add_score.connect(_add_points)

func _reset_round():
	pinball.reset_state = true

func _add_points(points : int):
	score += points
	print("Score: ", score)

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("Reset")):
		_reset_round()

func _set_board_state_to_shop() -> void:
	board_state = BOARD_STATE.BUYING
	_init_shop_ui()
	
func _set_board_state_to_playing() -> void:
	board_state = BOARD_STATE.PLAYING

func _init_shop_ui() -> void:
	print ("initializing shop ui")
	
func _close_shop_ui() -> void:
	print("closing shop ui")
