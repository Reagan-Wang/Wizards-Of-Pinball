extends ScoringElement

@export var shield : int

func collide():
	SignalBus.emit_signal("add_shield", shield)
