extends Control

export(NodePath) onready var username = get_node(username) as LineEdit
export(NodePath) onready var password = get_node(password) as LineEdit
export(NodePath) onready var username_error = get_node(username_error) as Control
export(NodePath) onready var password_error = get_node(password_error) as Control

var popups = [
	preload("res://games/captchas/recaptcha/recaptcha.tscn"),
	preload("res://games/captchas/writetheword/word.tscn"),
	preload("res://games/captchas/cookies/cookies.tscn"),
	preload("res://games/captchas/termsandconditions/termsandconditions.tscn"),
	preload("res://games/captchas/survey/survey.tscn"),
	preload("res://games/captchas/doors/doors.tscn"),
	preload("res://games/captchas/maze/maze.tscn"),
	preload("res://games/captchas/wires/wires.tscn"),
	preload("res://games/captchas/shooter/shooter.tscn"),
	preload("res://games/captchas/hacker/hacker.tscn"),
]

var popup_index: int = 0
var current_popup: Captcha

func attempt_signin():
	if username.text != Global.username:
		push_username_error("This username is not in our database. The usernames we have in our database are: " + Global.username)
		return
	username_error.visible = false
	if password.text != Global.password:
		push_password_error("This password does not match the username. The password is " + Global.password)
		return
	password_error.visible = false
	popup_index = 0
	create_popup(0)
	$CenterContainer/VBoxContainer/signin.disabled = true

func popup_done():
	Global.play_sound(preload("res://menu/audio/confirm.ogg"),0.2)
	if popup_index < popups.size() - 1:
		popup_index += 1
		create_popup(popup_index)
	else:
		yield(get_tree().create_timer(1.0),"timeout")
		Global.play_sound(preload("res://menu/audio/wrong.ogg"))
		var e = preload("res://menu/error/error.tscn").instance()
		add_child(e)

func create_popup(index: int):
	current_popup = popups[index].instance()
	add_child(current_popup)
	current_popup.connect("done",self,"popup_done")
	current_popup.connect("failed",self,"popup_failed")
	current_popup.rect_position = Vector2(640,360) - current_popup.rect_size/2

func popup_failed():
	current_popup.queue_free()
	push_password_error("Verification failed. Please try again.")
	$CenterContainer/VBoxContainer/signin.disabled = false
	
func push_username_error(text: String):
	Global.create_toast("Error: " + text)
	Global.play_sound(preload("res://menu/audio/wrong.ogg"))
	username_error.visible = true
	username_error.get_node("Label").text = text

func push_password_error(text: String):
	Global.create_toast("Error: " + text)
	Global.play_sound(preload("res://menu/audio/wrong.ogg"))
	password_error.visible = true
	password_error.get_node("Label").text = text


func _on_Button_button_down():
	$CenterContainer/VBoxContainer/password/password.secret = false
	$CenterContainer/VBoxContainer/password/password/AnimatedSprite.play("press")


func _on_Button_button_up():
	$CenterContainer/VBoxContainer/password/password.secret = true
	$CenterContainer/VBoxContainer/password/password/AnimatedSprite.play("unpress")

func _process(delta):
	if is_instance_valid(current_popup):
		if current_popup.timer <= 0:
			popup_failed()
		$Timer.rect_scale.x = ease(current_popup.timer / current_popup.max_time,-2.0)
	else:
		$Timer.rect_scale.x = 0.0
		

func _on_Fullscreen_pressed():
	OS.window_maximized = not OS.window_maximized


func _on_Exit_pressed():
	get_tree().quit()
