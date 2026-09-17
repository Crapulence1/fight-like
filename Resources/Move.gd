extends Resource
class_name Move


signal move_added

enum Guard {HIGH, LOW, ALL}

@export var move_name : StringName
@export var damage : float
@export var frame_data : FrameData
@export var knock_back : float
@export_enum("High", "Low", "All") var guard 
@export var animation : Animation

func _init(
	_move_name: StringName = "",
	 _frame_data : FrameData = null,
	 _damage : float = 0.0,
	 _knock_back : float = 0.0,
	 _guard : Guard = Guard.ALL,
	 _animation : Animation = null
	) -> void:
	move_name = _move_name
	damage = _damage
	frame_data = _frame_data
	knock_back = _knock_back
	guard = _guard
	animation = _animation
	move_added.emit()

func use() -> void:
	#animation.play()
	pass
