@tool
extends Node
class_name Frame

enum FrameType {
	EMPTY, 
	SINGLE, 
	MULTI  
}

@export var type : FrameType
@export var damage : float
@export var knockback : Vector2
@export var screenShake : float
@export var hitStop : float
@export var status : Dictionary

@export var new_frame_data = {
	"type": FrameType.SINGLE,
	"damage": 0.0,
	" ": Vector2(0, 0),
	"screenShake": 0.0,
	"hitStop": 0.0,
	"status": {}
}

var hitboxShapes: Array[CollisionShape2D] = []
