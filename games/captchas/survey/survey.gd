extends Captcha

onready var question_scene = load("res://games/captchas/survey/question.tscn")

const pitanja = [
  {
	"pitanje": "What's your hair color?",
	"odgovori": ["Blue", "Green", "Red"]
  },
  {
	"pitanje": "How tall are you?",
	"odgovori": [
	  "165cm",
	  "166cm",
	  "167cm",
	  "168cm",
	  "169cm",
	  "5cm",
	  "170cm",
	  "171cm",
	  "172cm",
	  "173cm",
	  "174cm",
	  "175cm",
	  "176cm",
	  "189cm",
	  "300cm"
	]
  },
  {
	"pitanje": "Which name do you prefer for the main character of a fantasy novel?",
	"odgovori": ["Arthur", "Nico", "Grey"]
  },
  {
	"pitanje": "How enjoyable is your life(1-10)?",
	"odgovori": ["3", "5", "9", "6"]
  },
  {
	"pitanje": "Do you accept cookies?",
	"odgovori": ["Yes", "Required ones only"]
  },
  {
	"pitanje": "Which OS do you use mostly in your work?",
	"odgovori": ["Linux", "Mac", "Windows XP", "Windows Vista", "Windows 95", "DOS", "a"]
  },
  {
	"pitanje": "Do you like chocolate.",
	"odgovori": ["Yes", "No"]
  },
  {
	"pitanje": "Ever heard of Pecina Smrti 3?",
	"odgovori": ["Yes", "No"]
  },
  {
	"pitanje": "Do you like reading!",
	"odgovori": ["yse", "No."]
  },
  {
	"pitanje": "Do you sleep in the afternoon?",
	"odgovori": ["Yes", "Sometimes", "No"]
  },
  {
	"pitanje": "How often do you have nightmares?",
	"odgovori": ["Every night", "Once or twice a week", "Few in a month", "Never"]
  },
  {
	"pitanje": "Do you sleep wearing socks?",
	"odgovori": ["All the time", "Sometimes", "When it gets very cold", "Rarely", "Never"]
  },
  {
	"pitanje": "Do you ever talk in your sleep?",
	"odgovori": ["Always", "Rarely", "Nah"]
  },
  {
	"pitanje": "Do you hawe friends?",
	"odgovori": ["I think", "No"]
  },
  {
	"pitanje": "Which search engine do you use",
	"odgovori": ["Bing", "DuckDuckGo", "Ecosia", "Prefer not to say"]
  },
  {
	"pitanje": "Do you think the guy who killed Hitler should have a statue of his own?",
	"odgovori": ["Obviously", "Yes", "Prefer not to say", "No", "Skip"]
  },
  {
	"pitanje": "Have you enjoyed this survey?",
	"odgovori": ["Yes", "Yes"]
  },
  {
	"pitanje": "test question 5",
	"odgovori": ["option1", "optio n2"]
  }
]



func _init():
	max_time = 34
	
func _ready():
	for q in pitanja:
		var b = question_scene.instance()
		b.load_question(q)
		$ScrollContainer/VBoxContainer.add_child(b)
	var submit = Button.new()
	submit.text = "Submit"
	$ScrollContainer/VBoxContainer.add_child(submit)
	submit.connect("pressed",self,"submit")

func submit():
	emit_signal("done")
	queue_free()
