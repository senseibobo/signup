extends Verifikacija
class_name Troll

var game: Control

func get_troll(text: String):
	pass

func verifikacija(text: String):
	game.trenutne_verifikacije.remove(self)
	return false
