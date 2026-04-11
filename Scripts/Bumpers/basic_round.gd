extends ScoringElement

@export var score : int

func collide():
	SignalBus.emit_signal("add_score", score)
