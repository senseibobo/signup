extends KinematicBody2D
class_name MazePlayer

var speed: float = 100.0

func _physics_process(delta):
	var dir = Vector2(
		Input.get_axis("move_left","move_right"),
		Input.get_axis("move_up","move_down")
	).normalized()
	move_and_slide(dir*speed)
