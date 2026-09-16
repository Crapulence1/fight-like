extends Resource
class_name InputBuffer


@export var buffer_frame_count : int = 5


var buffer : Dictionary[InputEvent, int]
var last_input : InputEvent

var current_frame : int = 0
func _input(event: InputEvent) -> void:
	if event:
		if last_input != event:
			current_frame = 0
			last_input = event
			
		if current_frame >= buffer_frame_count and last_input != event:
			return
			
		buffer[event] = current_frame
		current_frame += 1


func store_input() -> void:
	
	pass
