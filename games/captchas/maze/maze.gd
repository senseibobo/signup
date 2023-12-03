extends Captcha

func _init():
	max_time = 16.0


func _on_Area2D_body_entered(body):
	if body is MazePlayer:
		emit_signal("done")
		queue_free()
