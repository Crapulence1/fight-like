extends CharacterBody2D

@export var anim : AnimationPlayer


func _ready() -> void:
	#print($moves_holder/Kick.Move_data)
	#anim.
	anim.add_animation("Kick", load($moves_holder/Kick.Move_data.animation_file_path))
	
	#current_moves["Kick"].move_added.connect(add_move)
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Kick"):
		$AnimationPlayer.play("Kick")
		pass
	pass

func add_move() -> void:
	
	pass
