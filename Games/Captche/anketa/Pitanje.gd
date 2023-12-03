extends Control


func load_question(question: Dictionary):
	var q = question["pitanje"]
	var a = question["odgovori"]
	$Label.text = q
	var g = ButtonGroup.new()

	for i in a:
		var b = CheckBox.new()
		
		b.text = i
		b.group = g
		add_child(b)
		
