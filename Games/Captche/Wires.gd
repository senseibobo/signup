extends Captcha

var dragging: Control

var colors = [
	Color.brown,
	Color.darkblue,
	Color.webgreen,
	Color.rebeccapurple
]

func _init():
	max_time = 6.3
	
var d = 4

func connected():
	d -= 1
	if d == 0:
		yield(get_tree().create_timer(0.5),"timeout")
		emit_signal("done")
		queue_free()

func _ready():
	colors.shuffle()
	var i = 0
	for c in $VBoxContainer.get_children():
		c.get_node("Light").modulate = colors[i]
		i+=1
	colors.shuffle()
	i = 0
	for c in $VBoxContainer2.get_children():
		c.get_node("Light").modulate = colors[i]
		i+=1
