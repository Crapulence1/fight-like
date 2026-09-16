extends Resource
class_name FrameData

@export var start_up_frames : int = 1
@export var active_frames : int = 1
@export var recovery_frames : int = 1
@export var frame_advantage : int #If negative -> disadvantage

func _init(_start_up_frames : int = 0, _active_frames : int = 0, _recovery_frames : int = 0, _frame_advantage : int = 0) -> void:
	start_up_frames = _start_up_frames
	active_frames = _active_frames
	recovery_frames = _recovery_frames
	frame_advantage = _frame_advantage



func start_frames() -> void:
	pass
