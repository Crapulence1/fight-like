extends CharacterBody2D
class_name Player

@export var anim : AnimationPlayer
@export var move_list : MoveList
@export var input_buffer : InputBuffer

@export var input_component : InputComponent
@export var movement_component : MovementComponent
@export var flip_component : FlipComponent
@export var frame_data_manager : FrameDataManager
@export var state : StateChart

static var player : Player = null

func _enter_tree() -> void:
	player = self


func _ready() -> void:
	move_list.move_list["Kick"] = Move.new("Kick", FrameData.new(1, 1, 1, 1), 1, 1, Move.Guard.ALL, load("res://Moves/Normals/Kick.res"))
	anim.add_animation_library("Moves", move_list.move_library)
	pass
	#current_moves["Kick"].move_added.connect(add_move)

func _process(delta: float) -> void:
	movement_component.dir = input_component.dir
	movement_component.wants_jump = input_component.is_jump_pressed
	input_component.is_jump_pressed = false
	
	movement_component.tick(delta)
	
	if Input.is_action_just_pressed("Kick"):
		frame_data_manager.start_attack("Kick")
	
	if velocity.x != 0:
		state.send_event("walking")
	else:
		state.send_event("not_walking")

func add_move(move : Move) -> void:
	move_list.move_list[move.move_name] = move
	move_list.move_library.add_animation(move.move_name, move.animation)
	print("Added move")


func _on_hit_recieved(target : Node2D, damage : float) -> void:
	
	pass
