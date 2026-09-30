extends Node
class_name FightComponent

signal move_chosen(move : Move)

@export var health : float
@export var moves : Array[Move]
@export var max_frames : int = 20

func _on_input_component_attack_pressed(last_input: Array[DirInput], attack: String) -> void:
	var best_move : Move = null
	for move in moves:
		if move.required_attack != attack:
			continue
		if not _matches(last_input, move):
			continue
		if best_move == null or move.required_direction_inputs.size() > best_move.required_direction_inputs.size():
				best_move = move
	
	if best_move:
		print("Performing: ", best_move.move_name)
		move_chosen.emit(best_move)

func _matches(inputs: Array[DirInput], move: Move) -> bool:
	var sequence : Array[int] = move.required_direction_inputs
	var frames_elapsed : int = 0
	var sequence_index : int = sequence.size() - 1
	
	for input in inputs:
		frames_elapsed += input.frame_amount
		if frames_elapsed > max_frames and input.direction != 5:
			return false
	
		if input.direction == sequence[sequence_index]:
			sequence_index -= 1
			if sequence_index < 0:
				return true
	
	return false
