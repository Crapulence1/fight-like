extends Node

var fight_manager : FightManager = null

func _ready() -> void:
	fight_manager = FightManager.new()
	add_child(fight_manager)
	print(fight_manager)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Escape"):
		get_tree().quit()
