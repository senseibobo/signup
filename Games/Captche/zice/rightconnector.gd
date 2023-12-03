extends Control

func _input(event):
	if event is InputEventMouseButton:
		if (not event.is_pressed() and
			event.button_index == BUTTON_LEFT and 
			$Light.get_global_rect().has_point(get_global_mouse_position())):
				if $"../..".dragging != null and $"../..".dragging.get_node("Light").modulate == $Light.modulate:
					$"../..".dragging.connect_to(rect_global_position)
