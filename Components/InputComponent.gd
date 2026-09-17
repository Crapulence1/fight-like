extends Node
class_name InputComponent


var dir : int
var is_jump_pressed : bool
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	dir = Input.get_axis("Left", "Right")
	if Input.is_action_just_pressed("Jump"):
		is_jump_pressed = true
