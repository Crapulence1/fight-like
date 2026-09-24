@tool
extends Area2D
class_name MoveFrameData

@export var frame_script : Resource 
@export var anim_name: String = ""

var isAttackActive: bool = false
var frame_index : int = 0

func _ready() -> void:
	monitoring = false
	monitorable = false
	if anim_name.is_empty():
		push_error("animationName must be set")

func add_empty_frame() -> void:
	var hitbox = CollisionShape2D.new()
	hitbox.name = "Frame" + str((get_child_count())) + "_Empty"
	
	hitbox.disabled = true
	hitbox.position = Vector2(10, 0)
	hitbox.scale = Vector2(1, 0.1)
	hitbox.top_level = false
	
	hitbox.set_script(frame_script)
	hitbox.type = hitbox.FrameType.EMPTY
	add_child(hitbox)
	hitbox.owner = get_tree().edited_scene_root
	frame_index += 1

func add_single_frame() -> void:
	var hitbox = CollisionShape2D.new()
	hitbox.name = "Frame" + str((get_child_count())) + "_Single"
	
	var shape = RectangleShape2D.new()
	shape.size = Vector2(20, 160)
	hitbox.shape = shape
	hitbox.disabled = true
	hitbox.position = Vector2(10, 0)
	hitbox.scale = Vector2(1, 0.1)
	hitbox.top_level = false
	
	hitbox.set_script(frame_script)
	hitbox.type = hitbox.FrameType.SINGLE
	add_child(hitbox)
	hitbox.owner = get_tree().edited_scene_root
	frame_index += 1
	
	
	
func add_multi_frame() -> void:
	for i in range(2):
		var hitbox = CollisionShape2D.new()
		hitbox.name = "Frame" + str(frame_index) + "_" + char(65 + i)
		
		var shape = RectangleShape2D.new()
		shape.size = Vector2(20, 160)
		hitbox.shape = shape
		hitbox.disabled = true
		hitbox.position = Vector2(10, 0)
		hitbox.scale = Vector2(1, 0.1)
		hitbox.top_level = false
		
		hitbox.set_script(frame_script)
		hitbox.type = hitbox.FrameType.MULTI
		add_child(hitbox)
		hitbox.owner = get_tree().edited_scene_root
	frame_index += 1
	

func add_hitbox_to_frame(frame_index : int) -> void:
	var frame : Frame = get_child(frame_index)
	
	if frame.type == frame.FrameType.EMPTY:
		frame.type = frame.FrameType.SINGLE
		frame.name = frame.name.replace("Empty", "Single")
	
	if frame.type == frame.FrameType.SINGLE:
		frame.type = frame.FrameType.MULTI
		

func clear_frames() -> void:
	for i in get_children():
		remove_child(i)
		i.queue_free()
	print("Cleared frames")
	frame_index = 0

func _get_tool_buttons() -> Array:
	return [
		{
			call="add_empty_frame",
			hint="Add a frame with no hitbox"
		},
		{
			call="add_single_frame",
			tint=Color.AQUA,
			hint="Add a frame with one hitbox"
		},
		{
			call="add_multi_frame",
			tint=Color.LAWN_GREEN,
			hint="Add a frame with multiple hitboxes"
		},
		{
			call="clear_frames",
			tint=Color.RED,
			hint="Clear all frames"
		}
		
	]
