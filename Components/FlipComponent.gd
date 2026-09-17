extends Node
class_name FlipComponent

@export var body : CharacterBody2D



func _ready() -> void:
	Global.fight_manager.flip.connect(flip)
	pass

func flip() -> void:
	body.scale.x = body.scale.x * -1
	print(str(body.name, " has flipped"))
