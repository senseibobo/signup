extends Control

signal character_selected(character)

const chars = ["#","0","1","2","3","4","5","6","7","8","9"]

var stopped: bool = true

func _process(delta):
	if stopped: return
	var s = $Control/Label.rect_size.y
	$Control.rect_position.y = wrapf($Control.rect_position.y+delta*150.0,-s,0)
	var a = 1.0-($Control.rect_position.y+s)/s
	if Input.is_action_just_pressed("ui_accept"):
		var c = chars[wrapf(a*chars.size()+2.5,0,chars.size())]
		emit_signal("character_selected",c)
		$Control.rect_position.y = stepify(a,1.0/chars.size()) * -s
		stopped = true
