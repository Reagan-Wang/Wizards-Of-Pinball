extends StaticBody2D
class_name ScoringElement

@export var bounce_strength : float

# Override this for non-circle shaped bumpers
var bounce_vector : Vector2 = Vector2.ZERO

func collide():
	print("Collided")
