extends Verifikacija
class_name ManjeVise

enum TIP {
	VISE,
	MANJE
}

var tip: int = TIP.VISE
var broj: int

func verifikuj(text: String):
	if tip == TIP.VISE and broj > text.length():
		message = "Your password must be at least " + str(broj) + " characters long."
		return false
	elif tip == TIP.MANJE and broj < text.length():
		message = "Your password must be less than " + str(broj) + " characters long."
		return false
	return true
