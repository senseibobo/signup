extends Slovo
class_name RandomSlovo

func _init():
	slovo = char(ord("a")+randi()%26)
