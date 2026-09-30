extends RefCounted
class_name DirInput

var direction : int
var frame_amount : int


func _init(_direction : int, _frame_amount : int) -> void:
	direction = _direction
	frame_amount = _frame_amount



func _to_string() -> String:
	return str(direction, " ", frame_amount)
