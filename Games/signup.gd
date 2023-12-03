extends Control

export(NodePath) onready var username = get_node(username) as LineEdit
export(NodePath) onready var password = get_node(password) as LineEdit
export(NodePath) onready var username_error = get_node(username_error) as Control
export(NodePath) onready var password_error = get_node(password_error) as Control

const broj_verifikacija = 6


const verifikacije = [
	ManjeViseTroll,
	RandomSlovo,
	RandomBroj,
	DrugoSlovoTroll,
	Zivotinje,
	Drzave
]

var trenutne_verifikacije = []

func _ready():
	randomize()
	var t = verifikacije
	for i in min(broj_verifikacija,verifikacije.size()):
		trenutne_verifikacije.append(t[i].new())


func attempt_signup():
	if not verify_username(): return
	if not verify_password(): return
	Global.username = username.text
	Global.password = password.text
	Global.create_toast("You have successfully created an account! Please log in. Username: " + Global.username + ", password: " + Global.password)
	Global.play_sound(preload("res://menu/audio/success.ogg"))
	get_tree().change_scene_to(Global.signin_scene)

func verify_username():
	if username.text.length() < 8 or username.text.length() > 16:
		push_username_error("Your username must be between 8 and 16 characters long.")
		return false
	for c in username.text:
		var n = ord(c)
		if not ((n >= ord("a") and n <= ord("z")) or (n >= ord("A") and n <= ord("Z")) or (n >= ord("0") and n <= ord("9"))) :
			push_username_error("You must only have alphanumeric characters in your username.")
			return false
	username_error.visible = false
	return true

func verify_password():
	var i = -1
	for v in trenutne_verifikacije:
		i+=1
		v = v as Verifikacija
		if v is Troll:
			trenutne_verifikacije[i] = v.get_troll(password.text)
			trenutne_verifikacije.erase(v)
			return verify_password()
		if v == null:
			continue
		if not v.verifikuj(password.text):
			push_password_error(v.message)
			return false
	password_error.visible = false
	return true
	
			
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


func _on_Fullscreen_pressed():
	OS.window_maximized = not OS.window_maximized


func _on_Exit_pressed():
	get_tree().quit()
