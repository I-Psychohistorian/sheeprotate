extends "res://scripts/boat.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	up = Input.is_action_pressed("up")
	down = Input.is_action_pressed("down")
	left = Input.is_action_pressed("left")
	right = Input.is_action_pressed("right")
	dash = dash || Input.is_action_just_pressed("dash")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
