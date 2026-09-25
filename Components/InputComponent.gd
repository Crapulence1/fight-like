extends Node
class_name InputComponent

signal crouching
signal uncrouching

var dir : int
var button_input : int = 5
var is_jump_pressed : bool
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if button_input == 4:
		dir = -1
	elif button_input == 6:
		dir = 1
	else:
		dir = 0
	
	check_button_input() 
	print(button_input)
	
	if Input.is_action_just_pressed("Jump"):
		is_jump_pressed = true


func check_button_input() -> void:
	#Just pressed
	if Input.is_action_just_pressed("Right"):
		button_input += 1
	if Input.is_action_just_pressed("Up"):
		button_input += 3
	if Input.is_action_just_pressed("Down"):
		crouching.emit()
		button_input -= 3
	if Input.is_action_just_pressed("Left"):
		button_input -= 1
	
	#Just released
	if Input.is_action_just_released("Right"):
		button_input -= 1
	if Input.is_action_just_released("Up"):
		button_input -= 3
	if Input.is_action_just_released("Down"):
		uncrouching.emit()
		button_input += 3
	if Input.is_action_just_released("Left"):
		button_input += 1
