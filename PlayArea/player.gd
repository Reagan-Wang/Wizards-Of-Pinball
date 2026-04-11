extends Node
class_name Player

@onready var info : Label = $Info

@export var player_max_health : int = 20

var player_health : int
var player_shield : int

func _ready() -> void:
	player_health = player_max_health
	_update_info_label()
	player_health = player_health
	player_shield = 0
	SignalBus.attack_player.connect(_attacked)
	SignalBus.add_shield.connect(_add_player_shield)

func _attacked(damage : int) -> void:
	if (player_shield >= damage):
		player_shield -= damage
	else:
		damage -= player_shield
		player_shield = 0
		_damaged(damage)
	_update_info_label()

func _add_player_shield(shield : int) -> void:
	player_shield += shield
	_update_info_label()

func _update_info_label() -> void:
	info.text = "HP: " + str(player_health) + " / " + str(player_max_health) + "\n
	Shield: " + str(player_shield)

func _damaged(damage : int) -> void:
	player_health -= damage

func reset() -> void:
	player_health = player_max_health
	player_shield = 0
	_update_info_label()
