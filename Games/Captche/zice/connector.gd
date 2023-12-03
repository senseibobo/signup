extends Control

var dragging: bool = false
var connected: bool = false

func _input(event):
	if connected: return
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_LEFT and $Light.get_global_rect().has_point(get_global_mouse_position()):
				dragging = true
				$"../..".dragging = self
		else:
			dragging = false
			if $"../..".dragging == self:
				$"../..".dragging = null

func connect_to(pos: Vector2):
	connected = true
	$Light/Line2D.points = PoolVector2Array([Vector2(0.0,0.0), pos-$Light/Line2D.global_position])
	$"../..".connected()

func _process(delta):
	if connected: return
	if dragging:
		$Light/Line2D.points = PoolVector2Array([Vector2(0.0,0.0), get_global_mouse_position()-$Light/Line2D.global_position])
	else:
		$Light/Line2D.points = PoolVector2Array([Vector2(0.0,0.0)])
