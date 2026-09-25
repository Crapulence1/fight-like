extends Node
class_name FlipComponent

signal flipped

@export var body : CharacterBody2D

var forward_dir : int = 1

func _ready() -> void:
	Global.fight_manager.flip.connect(flip)

func flip() -> void:
	body.scale.x = body.scale.x * -1
	print(str(body.name, " has flipped"))
