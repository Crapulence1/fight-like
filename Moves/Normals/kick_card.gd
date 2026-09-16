extends Area2D

@export var card_component : CardComponent


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.add_move(card_component.move)
		
