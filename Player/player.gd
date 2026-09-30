extends CharacterBody2D
class_name Player

@export var anim : AnimationPlayer
@export var move_list : MoveList
@export var input_buffer : InputBuffer

@export var input_component : InputComponent
@export var movement_component : MovementComponent
@export var flip_component : FlipComponent
@export var frame_data_manager : FrameDataManager
@export var state_component : StateComponent
@export var fight_component : FightComponent
static var player : Player = null

func _enter_tree() -> void:
	player = self


func _ready() -> void:
	fight_component.moves.append(Move.new("Slash", [5], "Slash", load("res://Moves/Normals/Kick.res")))
	anim.add_animation_library("Moves", move_list.move_library)
	#anim.play("idle")

func _process(delta: float) -> void:
	movement_component.dir = input_component.dir
	movement_component.wants_jump = input_component.is_jump_pressed
	input_component.is_jump_pressed = false
	
	movement_component.tick(delta)
	state_component.tick(delta)
	

func add_move(move : Move) -> void:
	move_list.move_list[move.move_name] = move
	move_list.move_library.add_animation(move.move_name, move.animation)
	print("Added move")
