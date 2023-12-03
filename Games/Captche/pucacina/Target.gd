extends Spatial

signal death

func death():
	emit_signal("death")
	queue_free()
