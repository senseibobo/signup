extends Panel
class_name Captcha

signal done
signal failed

var max_time: float = 5.0
var timer: float

func _ready():
	timer = max_time

func _process(delta):
	timer -= delta*0.8552 #8552
	if timer <= 0:
		emit_signal("failed")
