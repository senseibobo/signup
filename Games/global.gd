extends Node

var username: String
var password: String

var dragging: bool = false

const toast_scene = preload("res://menu/toast/toast.tscn")
const signin_scene = preload("res://games/signin.tscn")
const signup_scene = preload("res://games/signup.tscn")


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and get_viewport().get_mouse_position().y < 32:
			dragging = event.pressed
	elif dragging and event is InputEventMouseMotion:
		OS.window_position += event.relative

func create_toast(text: String):
	var c = CanvasLayer.new()
	c.layer = 5
	add_child(c)
	var t = toast_scene.instance()
	t.text = text
	c.add_child(t)

func play_sound(sound: AudioStream, time: float = 0.0):
	var p = AudioStreamPlayer.new()
	p.stream = sound
	p.volume_db = -10
	add_child(p)
	p.connect("finished",p,"queue_free")
	p.play(time)
	return p
