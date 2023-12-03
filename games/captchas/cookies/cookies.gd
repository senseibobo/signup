extends Captcha


var i: int

func _init():
	max_time = 10.0

func _process(delta):
	if $Button.get_global_rect().has_point(get_global_mouse_position()):
		if i < 20:
			$Button.rect_position = Vector2(rand_range(-174,130),rand_range(-190,210))
			i += 1
		else:
			$Button.disabled = false


func _on_Button_pressed():
	emit_signal("done")
	queue_free()
