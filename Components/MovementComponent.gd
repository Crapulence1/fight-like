extends Node
class_name MovementComponent

@export var Speed : float
@export var Jump_height : float
@export var gravity : float
@export var body : CharacterBody2D


var dir : int
var wants_jump : bool

func tick(delta : float) -> void:
	apply_gravity()
	body.velocity.x = dir * Speed
	
	if wants_jump:
		body.velocity.y = -Jump_height
	
	
	
	body.move_and_slide()



func apply_gravity() -> void:
	body.velocity.y += gravity
	pass
