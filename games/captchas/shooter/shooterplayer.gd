extends Camera

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x*0.5
		rotation_degrees.x -= event.relative.y*0.5
		rotation_degrees.x = clamp(rotation_degrees.x,-90,90)
	elif event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			shoot()

func shoot():
	Global.play_sound(preload("res://menu/audio/gunshot.ogg"))
	if $RayCast.is_colliding():
		var collider = $RayCast.get_collider()
		collider.get_parent().death()
