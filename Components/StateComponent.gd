extends Node
class_name StateComponent

@export var state_chart : StateChart
@export var body : CharacterBody2D
@export var anim : AnimationPlayer
#States
#Idle, Walk, Attack, Recover


func tick(delta : float) -> void:
	if body.velocity.x != 0:
		state_chart.send_event("walking")
	else:
		state_chart.send_event("idle")
	
	if body.is_on_floor():
		state_chart.send_event("grounded")
	else:
		state_chart.send_event("airborne")
	



func _on_walk_state_entered() -> void:
	anim.play("walk")


func _on_attacking_state_entered() -> void:
	body.velocity.x = 0


func _on_frame_data_manager_finished_attack() -> void:
	state_chart.send_event("finished_attack")


func _on_frame_data_manager_started_attack() -> void:
	state_chart.send_event("attacking")


func _on_idle_state_entered() -> void:
	anim.play("idle")
	


func _on_input_component_crouching() -> void:
	state_chart.send_event("crouching")


func _on_input_component_uncrouching() -> void:
	state_chart.send_event("uncrouching")
