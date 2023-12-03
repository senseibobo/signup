extends Captcha


var words: Array = []

const w = """taraba
izenfur
bakar
distort
scandal
grass
charter
despize
snatch
BOmBe
abolish
inquiry
inflate
impound
Ki1NgCO5"""

func _init():
	max_time = 10.0

func _ready():
	words = w.split("\n")
	$Label3.text = words[randi()%words.size()]



func _on_Button_pressed():
	if $LineEdit.text == $Label3.text:
		emit_signal("done")
		queue_free()
	else:
		emit_signal("failed")
