extends Verifikacija
class_name Slovo

var slovo: String

func verifikuj(text: String):
	var t: String
	if slovo in "0123456789":
		t = "number"
	else:
		t = "letter"
	message = "You cannot use the " + t + " \"" + slovo.to_upper() + "\" in your password."
	if slovo in text.to_lower():
		return false
	return true
