extends Troll
class_name ManjeViseTroll

func get_troll(text: String):
	if text.length() < 10:
		var v = ManjeVise.new()
		v.tip = v.TIP.VISE
		v.broj = max(text.length(),8)
		return v
	elif text.length() > 10:
		var v = ManjeVise.new()
		v.tip = v.TIP.MANJE
		v.broj = min(text.length(),15)
		return v
	else:
		var v = ManjeVise.new()
		v.tip = v.TIP.VISE
		v.broj = 11
		
