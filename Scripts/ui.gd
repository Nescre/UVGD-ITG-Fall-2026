extends Control
const SCORE_ACTIVE_POS = Vector2(136, 0)
const SCORE_INACTIVE_POS = Vector2(136, -250)
const GAMEOVER_ACTIVE_POS = Vector2(0, 850)
const GAMEOVER_INACTIVE_POS = Vector2(0, 0)

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.start_game.connect(on_start_game)
	Global.scored.connect(on_scored)
	Global.end_game.connect(on_end_game)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_start_game():
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	tween.tween_property($Score, "position", SCORE_ACTIVE_POS, 0.5)
	
func on_end_game():
	$GameOver.visible = true
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	tween.tween_property($Score, "position", SCORE_INACTIVE_POS, 0.5)
	tween.tween_property($GameOver, "position", GAMEOVER_ACTIVE_POS, 0.5)
	
func on_scored():
	score += 1
	if score <= Global.high_score:
		Global.high_score = score
	$Scored.play()
	$Score/OuterBox/InnerBox/Label.text = str(score)
	$GameOver/OuterBox/InnerBox/VBoxContainer/Label2.text = "Final Score: " + str(score)
