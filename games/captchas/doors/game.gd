extends Control

signal success
signal fail

onready var correct = randi()%3
var opendoor = preload("res://games/captchas/doors/dooropen.png")

func _ready():
	get_node("Door"+str(correct+1)).modulate = Color.white-Color(rand_range(0.05,0.08),rand_range(0.05,0.08),rand_range(0.05,0.08),0.0)

func _on_Door_pressed(number):
	if number == correct:
		emit_signal("success")
	else:
		emit_signal("fail")
	var door = get_node("Door"+str(number+1))
	for i in get_children():
		i.disabled = true
	door.texture_normal = opendoor
	door.texture_pressed = opendoor
	door.texture_hover = opendoor
	door.texture_disabled = opendoor
	door.texture_focused = opendoor
	
