extends Sprite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
onready var NPC = get_node("../NPCBoat")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = NPC.position.x
	position.y = NPC.position.y
