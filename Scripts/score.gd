extends Control
var score = 0
@onready var score_display = $OuterBox/InnerBox/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.scored.connect(update_score)
	set_score()

func set_score():
	score_display.text = "0"

func update_score():
	score += 1
	score_display.text = str(score)
	if score <= Global.high_score:
		Global.high_score = score
	$Scored.play()
