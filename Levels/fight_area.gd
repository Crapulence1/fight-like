extends Node2D

@export var spawn1 : Marker2D
@export var spawn2 : Marker2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Player.player.global_position = spawn1.global_position
	Global.fight_manager.enemy.global_position = spawn2.global_position 
	Global.fight_manager.start_fight()
