extends ScoringElement

@export var damage : int

func collide():
	SignalBus.attack_enemy.emit(damage)
