@tool
extends Node2D
class_name FrameDataManager

@export var sprite: Sprite2D
@export var anim : AnimationPlayer

var is_attack_active : bool = false
var active_move : MoveFrameData
var frame_index : int = 0
var last_frame : String

func _ready() -> void:
	_setup_sprite_connection()
	_setup_anim_connection()

func start_attack(move : String) -> void:
	is_attack_active = true
	anim.play("Moves/" + move)
	active_move = get_node(move)


func _on_frame_changed() -> void:
	if is_attack_active:
		
		for i in active_move.get_children():
			if i.name.contains(last_frame):
				i.disabled = true
		
		
		
		#Activates every frame that is in the multi-frame
		#if active_move.get_child(frame_index).type == active_move.get_child(frame_index).FrameType.MULTI:
		
		var frame_name : String = active_move.get_child(frame_index).name.get_slice("_", 0)
		
		print(frame_name)
		for i in active_move.get_children():
			if i.name.contains(frame_name):
				print("frame_change")
				frame_index+=1
				i.disabled = false
		last_frame = frame_name
		#else:
			#active_move.get_child(frame_index).disabled = false
			#frame_index+=1
			
		


func _on_anim_changed() -> void:
	print("Current animation is " + str(anim.current_animation))
	

func _setup_sprite_connection() -> void:
	if not sprite:
		push_error("Could not set up sprite connection, sprite does not exist")
	
	if sprite.frame_changed.is_connected(_on_frame_changed):
		sprite.frame_changed.disconnect(_on_frame_changed)
	sprite.frame_changed.connect(_on_frame_changed)


func _setup_anim_connection() -> void:
	if not anim:
		push_error("Could not set up anim connection, anim does not exist")
	
	if anim.animation_changed.is_connected(_on_anim_changed):
		anim.animation_changed.disconnect(_on_anim_changed)
	anim.animation_changed.connect(_on_anim_changed)




func add_move(move : MoveFrameData) -> void:
	add_child(move)
	move.owner
