extends Slovo
class_name RandomBroj

func _init():
	slovo = char(ord("0")+randi()%10)
