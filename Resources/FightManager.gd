extends Node
class_name FightManager

signal flip

enum PlayerSide {LEFT = 1, RIGHT = -1}
var player_side : PlayerSide = PlayerSide.LEFT

var player : Player = Player.player
var enemy : Enemy = Enemy.new()

var fight_started : bool = false

func _process(_delta: float) -> void:
	if fight_started:
		_check_player_side()
	
	if Input.is_action_just_pressed("Debug"):
		flip.emit()

func _check_player_side() -> void:
	if player_side == PlayerSide.LEFT:
		if player.global_position > enemy.global_position:
			player_side = PlayerSide.RIGHT
			flip.emit()
	
	if player_side == PlayerSide.RIGHT:
		if player.global_position < enemy.global_position:
			player_side = PlayerSide.LEFT
			flip.emit()

func start_fight() -> void:
	fight_started = true
