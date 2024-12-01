extends CharacterBody2D
class_name DroidMelee
@onready var velocity_and_direction: Node2D = $VelocityAndDirection
@onready var gun: Node2D = $Gun
const BULLET = preload("res://bullet.tscn")

var player_position: Vector2 = Vector2.ZERO
func _physics_process(_delta: float) -> void:
	velocity_and_direction.change_direction((player_position - get_position()).normalized())
	velocity_and_direction.move(self)


func on_hero_position_changed(new_player_position: Vector2) -> void:
	player_position = new_player_position


func _on_health_component_death() -> void:
	queue_free()

func _on_timer_timeout() -> void:
	gun.shoot(BULLET, player_position - global_position) # Replace with function body.
