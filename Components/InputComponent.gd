extends Node
class_name InputComponent


var dir : int
var is_jump_pressed : bool
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dir = Input.get_axis("Left", "Right")
	pass
