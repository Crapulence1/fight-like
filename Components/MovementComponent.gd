extends Node
class_name MovementComponent

@export var forward_speed : float
@export var backward_speed : float
@export var jump_height : float
@export var gravity : float
@export var body : CharacterBody2D


var dir : int
var wants_jump : bool
var has_jump : bool = true
var disable_movement : bool = false

func tick(delta : float) -> void:
	apply_gravity()
	movement()
	jump_logic()
	
	body.move_and_slide()

func jump_logic() -> void:
	if body.is_on_floor():
		has_jump = true
		disable_movement = false
	
	if wants_jump and has_jump:
		body.velocity.y = -jump_height
		disable_movement = true
		has_jump = false

func movement() -> void:
	if disable_movement:
		return
	
	if Global.fight_manager.player_side == dir:
		body.velocity.x = dir * forward_speed
	if Global.fight_manager.player_side != dir:
		body.velocity.x = dir * backward_speed

func apply_gravity() -> void:
	body.velocity.y += gravity
	pass

func _on_frame_data_manager_finished_attack() -> void:
	disable_movement = false
	pass # Replace with function body.

func _on_frame_data_manager_started_attack() -> void:
	disable_movement = true
	pass # Replace with function body.

func _on_flip_component_flipped() -> void:
	pass # Replace with function body.


func _on_input_component_crouching() -> void:
	disable_movement = true


func _on_input_component_uncrouching() -> void:
	disable_movement = false
