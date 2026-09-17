extends Node
class_name FlipComponent

func _ready() -> void:
	Global.fight_manager.flip.connect(flip)
	pass


func face_left() -> void:
	pass
	
	
func face_right() -> void:
	pass

func flip() -> void:
	print("Yo whatup I just flipped bro")
