extends Node2D

@export var spread: int = 1
@export var touch_ally: bool = false
@export var touch_enemy: bool = false

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func shoot(bullet: PackedScene, direction: Vector2):
	var new_bullet = bullet.instantiate()

	# Passer les paramètres de collision à la balle
	if touch_ally:
		new_bullet.layer = 8
		new_bullet.mask = 5
	if touch_enemy:
		new_bullet.layer = 7
		new_bullet.mask = 6 

	get_parent().get_parent().add_child(new_bullet)
	new_bullet.global_position = global_position
	new_bullet.call_deferred("direction", direction)
