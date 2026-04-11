extends RigidBody2D
class_name BasePinball

var reset_state : bool
var reset_position : Vector2

const BOUNCE_SCALING : float = 250 

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if reset_state:
		position = reset_position
		linear_velocity = Vector2.ZERO
		angular_velocity = 0.0
		reset_state = false

func _collide_with_element(body : Node) -> void:
	if body is ScoringElement:
		body as ScoringElement
		body.collide()
		var bounce_vector = body.bounce_vector
		if (body.bounce_vector == Vector2.ZERO):
			bounce_vector = position - body.position
		apply_impulse(bounce_vector.normalized() * body.bounce_strength * BOUNCE_SCALING)
