extends Captcha

var current_index: int = 0

var s = ""

func _init():
	max_time = 14.0

func _ready():
	start_hack(0)
	
func character_selected(character: String):
	s+=character
	current_index += 1
	if current_index <= 4:
		yield(get_tree().create_timer(0.2),"timeout")
		start_hack(current_index)
	else:
		if s == "#8552":
			emit_signal("done")
			queue_free()
		else:
			emit_signal("failed")

func start_hack(index: int):
	var a = get_node("Control"+str(index))
	a.stopped = false
	a.connect("character_selected",self,"character_selected")
