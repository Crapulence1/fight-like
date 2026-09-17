extends Node
class_name MovementComponent

@export var Speed : float
@export var Jump_height : float
@export var gravity : float
@export var body : CharacterBody2D


var dir : int
var wants_jump : bool
var has_jump : bool = true


func tick(delta : float) -> void:
	apply_gravity()
	body.velocity.x = dir * Speed
	
	if body.is_on_floor():
		has_jump = true
	
	if wants_jump and has_jump:
		body.velocity.y = -Jump_height
		has_jump = false
	
	
	body.move_and_slide()



func apply_gravity() -> void:
	body.velocity.y += gravity
	pass
