extends Camera2D
var shaking

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.end_game.connect(on_end_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_end_game():
	shake_cam(20, 1, true)

func shake_cam(intensity, duration, reduce_intensity):
	var timer = get_tree().create_timer(duration)
	var old_pos = position
	var new_pos = position + Vector2(0, intensity)
	while timer.time_left > 0:
		position = new_pos
		await get_tree().create_timer(0.03).timeout
		position = old_pos
		await get_tree().create_timer(0.03).timeout
		if reduce_intensity:
			new_pos.y = lerp(new_pos.y, old_pos.y, 0.15)
		
