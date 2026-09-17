extends Area2D
class_name FrameDataNode

@export var damage : float
@export var knockback : float


func _on_body_entered(body: Node2D) -> void:
	if body is Player or body is Enemy:
		if body.fight_component:
			body.fight_component.hit(damage, knockback)
		else: 
			push_error(str(body.name, " does not have a Fight Component"))
