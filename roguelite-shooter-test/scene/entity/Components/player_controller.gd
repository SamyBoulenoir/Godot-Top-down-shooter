extends Node2D

var input_direction: Vector2
signal shoot
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	input_direction = Vector2(
		Input.get_axis("move left", "move right"),
		Input.get_axis("move up", "move down")
	)
	handle_shoot()

func get_controller_input_direction():
	return input_direction

func handle_shoot():
	if Input.is_action_just_pressed("shoot"):
		if get_parent().has_node('Gun'):
			emit_signal("shoot")
			
