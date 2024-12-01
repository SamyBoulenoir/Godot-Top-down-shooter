extends CharacterBody2D
class_name RushBoys
@onready var velocity_and_direction: Node2D = $VelocityAndDirection


var player_position: Vector2 = Vector2.ZERO
func _physics_process(_delta: float) -> void:
	velocity_and_direction.change_direction((player_position - get_position()).normalized())
	velocity_and_direction.move(self)


func on_hero_position_changed(new_player_position: Vector2) -> void:
	player_position = new_player_position


func _on_health_component_death() -> void:
	queue_free()
