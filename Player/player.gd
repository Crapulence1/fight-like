extends CharacterBody2D

@export var anim : AnimationPlayer
@export var move_list : MoveList
@export var input_buffer : InputBuffer

func _ready() -> void:
	move_list.move_list["Kick"] = Move.new("Kick", FrameData.new(1, 1, 1, 1), 1, 1, Move.Guard.ALL)
	get_tree().physics_frame.connect(input_buffer._input)
	#current_moves["Kick"].move_added.connect(add_move)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Kick"):
		pass
func add_move() -> void:
	
	pass
