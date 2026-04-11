extends Node
class_name Enemy

@onready var label : Label = $Label

@export var max_health : int
@export var default_activation_time : float

var activation_timer : float
var health : int
var shield : int

func _ready() -> void:
	health = max_health
	activation_timer = default_activation_time
	_update_label()

func activate():
	activation_timer = default_activation_time

func reset():
	health = max_health
	activation_timer = default_activation_time

func _attacked(damage : int):
	if shield >= damage:
		shield -= damage
	else:
		damage -= shield
		_damaged(damage)
	_update_label()

func _damaged(damage : int):
	health -= damage

func _update_label():
	label.text = "HP: " + str(health) + " / " + str(max_health) + "\n
	Shield: " + str(shield)
