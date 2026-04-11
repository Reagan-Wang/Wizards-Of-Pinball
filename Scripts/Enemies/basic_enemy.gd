extends Enemy

@export var damage : int

func _ready() -> void:
	super()

func activate():
	super()
	SignalBus.emit_signal("attack_player", damage)
