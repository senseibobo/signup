extends Troll
class_name DrugoSlovoTroll

func get_troll(text: String):
	var troll = Slovo.new()
	troll.slovo = text[1]
	return troll

func verifikuj(text: String):
	return true
