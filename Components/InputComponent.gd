extends Node
class_name InputComponent

signal crouching
signal uncrouching
signal attack_pressed(last_input : Array[DirInput], attack : String)

var dir : int
var last_direction_input : int
var direction_input : int = 5
var is_jump_pressed : bool
var last_direction_inputs : Array[DirInput] #size 10 always
var frame_count : int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#print(queue)
	if direction_input == 4:
		dir = -1
	elif direction_input == 6:
		dir = 1
	else:
		dir = 0
	frame_count += 1
	check_direction_input() 
	check_attack_press()
	if last_direction_input != direction_input:
		var x : DirInput = DirInput.new(direction_input, frame_count)
		frame_count = 0
		if last_direction_inputs.size() > 10:
			last_direction_inputs.pop_back()
		last_direction_inputs.push_front(x)
	else: 
		last_direction_inputs[0].frame_amount += 1
	
	print(last_direction_inputs, " ", last_direction_input)
	last_direction_input = direction_input
	if Input.is_action_just_pressed("Jump"):
		is_jump_pressed = true



func check_attack_press() -> void:
	if Input.is_action_just_pressed("Kick"):
		attack_pressed.emit(last_direction_inputs, "Kick")
		
	if Input.is_action_just_pressed("Heavy Kick"):
		attack_pressed.emit(last_direction_inputs, "Heavy Kick")
		
	if Input.is_action_just_pressed("Punch"):
		attack_pressed.emit(last_direction_inputs, "Punch")
		
	if Input.is_action_just_pressed("Slash"):
		attack_pressed.emit(last_direction_inputs, "Slash")



func check_direction_input() -> void:
	#Just pressed
	if Input.is_action_just_pressed("Right"):
		direction_input += 1
	if Input.is_action_just_pressed("Up"):
		direction_input += 3
	if Input.is_action_just_pressed("Down"):
		crouching.emit()
		direction_input -= 3
	if Input.is_action_just_pressed("Left"):
		direction_input -= 1
	
	#Just released
	if Input.is_action_just_released("Right"):
		direction_input -= 1
	if Input.is_action_just_released("Up"):
		direction_input -= 3
	if Input.is_action_just_released("Down"):
		uncrouching.emit()
		direction_input += 3
	if Input.is_action_just_released("Left"):
		direction_input += 1
