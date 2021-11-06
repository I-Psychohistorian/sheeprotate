extends KinematicBody2D

export var turn_force: float = 0.02
export var move_force: float = 100

export var friction: float = .3
export var radial_friction: float = .2

var vel: Vector2 = Vector2.ZERO
var radial_vel: float = 0

var up: bool = false
var down: bool = false
var left: bool = false
var right: bool = false
var dash: bool = false

var tracking = false

onready var nose = $Forward


var mapsize = Vector2(4096,2400)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

	


func _physics_process(delta):
	if left:
		radial_vel -= turn_force
	if right:
		radial_vel += turn_force
	var dir = Vector2.UP.rotated(rotation)
	if up:
		vel += dir * move_force
	if down:
		vel -= dir * move_force

	vel *= (1 - friction)
	radial_vel *= (1 - radial_friction)

	vel = move_and_slide(vel)
	rotate(radial_vel)
	
	# print("radial vel:", radial_vel, "dir:", dir)
	facing()
	
	if position.x > mapsize.x:
		position.x = 0
	if position.x < 0:
		position.x = mapsize.x
	if position.y > mapsize.y:
		position.y = 0
	if position.y < 0:
		position.y = mapsize.y

#works to make npcboat face towards player. can be changed easily to make npcboat face away
func facing():
	var vision = $Sight_radius.get_overlapping_bodies()
	if tracking == true:
		for b in vision:
			if b.is_in_group("Player"):
				nose.look_at(b.global_transform.origin)
				rotate(nose.rotation * radial_vel * 1)

func dash(power: float):
	var dir = Vector2.ZERO




func _on_Sight_radius_body_entered(body):
	if body.is_in_group("Player"):
		tracking = true
		print('seen')


func _on_Sight_radius_body_exited(body):
	if body.is_in_group("Player"):
		tracking = false
		print('unseen')
