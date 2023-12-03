extends Spatial


const target = preload("res://Games/Captche/pucacina/Target.tscn")

var target_count: int = 5

func _ready():
	for i in range(target_count):
		var t = target.instance()
		add_child(t)
		t.global_transform.origin = Vector3(rand_range(-1,1),rand_range(-1,1),rand_range(-1,1)).normalized()*10.0
		t.look_at($Player.global_transform.origin,Vector3.UP)
		t.connect("death",self,"target_killed")

func target_killed():
	target_count -= 1
	if target_count == 0:
		$"../../..".emit_signal("done")
		$"../../..".queue_free()

func _exit_tree():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
