extends Captcha

func _init():
	max_time = 8.0
	
const doors = preload("res://games/captchas/doors/game.tscn")
	
const door_count: int = 5
var current_door: int = 1
var d: Control

func _ready():
	create_doors()

func create_doors():
	d = doors.instance()
	d.connect("success",self,"success")
	d.connect("fail",self,"fail")
	add_child(d)

func success():
	current_door += 1
	yield(get_tree().create_timer(0.5),"timeout")
	if current_door <= door_count:
		d.queue_free()
		create_doors()
	else:
		emit_signal("done")
		queue_free()
	

func fail():
	yield(get_tree().create_timer(0.5),"timeout")
	emit_signal("failed")
