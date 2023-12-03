extends Captcha

func _init():
	max_time = 10.0
	


func _on_Button_pressed():
	$Sprite.play("default")


func _on_Sprite_animation_finished():
	emit_signal("done")
	queue_free()
