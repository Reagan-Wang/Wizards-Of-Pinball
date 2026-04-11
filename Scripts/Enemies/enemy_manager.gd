extends Node
class_name EnemyManager

var enemies : Array[Enemy]

@export var enemy_pool : Array[Enemy]

func _ready() -> void:
	_initiate_encounter()
	SignalBus.attack_enemy.connect(_attack_enemy)

func _process(delta: float) -> void:
	for enemy in enemies:
		enemy.activation_timer -= delta
		
		if (enemy.activation_timer <= 0):
			enemy.activate()

func _initiate_encounter() -> void:
	enemies.append_array(enemy_pool)

func reset() -> void:
	for enemy in enemies:
		enemy.reset()

func _attack_enemy(damage : int):
	var enemy = enemies.pick_random()
	if enemy:
		enemy._attacked(damage)
