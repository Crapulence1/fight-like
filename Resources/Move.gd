extends Resource
class_name Move


signal move_added

@export var move_name : StringName
@export var required_direction_inputs : Array[int]
@export var required_attack : String
@export var animation : Animation

func _init(_move_name: StringName = "", _required_direction_inputs : Array[int] = [5], _required_attack : String = "Kick", _animation : Animation = null) -> void:
	move_name = _move_name
	required_direction_inputs = _required_direction_inputs
	required_attack = _required_attack
	animation = _animation
	move_added.emit()

func use() -> void:
	#animation.play()
	pass
