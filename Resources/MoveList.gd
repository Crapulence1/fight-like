extends Resource
class_name MoveList

@export var move_list : Dictionary[String, Move]
var move_library : AnimationLibrary = preload("uid://dfe7rn6utn8id")


func get_animation(name : String) -> Animation:
	return move_library.get_animation(name)
