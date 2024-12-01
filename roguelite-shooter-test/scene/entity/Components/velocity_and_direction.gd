extends Node2D

@export var speed: float = 0.0
@export var direction: Vector2 = Vector2(0, 0)
@export var minimal_speed: int = 0
@export var maximal_speed: int = 200

var actual_speed = speed
var actual_direction: Vector2 = direction
var movement: Vector2 = Vector2.ZERO

func _ready() -> void:
	actual_speed = speed
	actual_direction = direction

func _process(delta: float) -> void:
	if get_parent() != null:
		movement = (actual_direction.normalized() * actual_speed * delta)

func change_speed(new_speed: int):
	if new_speed <= minimal_speed:
		actual_speed = minimal_speed
	else:
		actual_speed = new_speed

func change_direction(new_direction: Vector2):
	actual_direction = new_direction.normalized()

func move(target: Node2D):
	target.move_and_collide(movement)
