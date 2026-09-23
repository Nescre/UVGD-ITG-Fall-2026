#Responsible for moving two sprites (its children) to create the illusion of movement
class_name SpriteScrollContainer
extends Node2D
var floors

@export var LEFT_X : float
@export var RIGHT_X : float
@export var speed_mod = 1 #Leave at 1 if you don't want change

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	floors = get_children()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	for floor in floors:
		floor.position.x -= Global.bird_speed / speed_mod
		if floor.position.x <= LEFT_X:
			floor.position.x = RIGHT_X
