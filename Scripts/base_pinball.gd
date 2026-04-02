extends RigidBody2D
class_name BasePinball

var reset_state : bool
var reset_position : Vector2

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if reset_state:
		position = reset_position
		linear_velocity = Vector2.ZERO
		angular_velocity = 0.0
		reset_state = false
