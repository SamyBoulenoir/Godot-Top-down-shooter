extends CharacterBody2D

@onready var velocity_and_direction: Node2D = $VelocityAndDirection
@onready var player_controller: Node2D = $PlayerController
@onready var gun: Node2D = $Gun
const BULLET = preload("res://bullet.tscn")

func _physics_process(_delta: float) -> void:
	var direction = player_controller.get_controller_input_direction()
	velocity_and_direction.change_direction(direction)
	velocity_and_direction.move(self)
	position_changed.emit(get_position())
	rotate_towards_mouse()
	
signal position_changed

func rotate_towards_mouse() -> void:
	var mouse_position = get_global_mouse_position()
	var direction_to_mouse = mouse_position - get_position()
	self.rotation = direction_to_mouse.angle()


func _on_health_component_death() -> void:
	queue_free()
	get_tree().change_scene_to_file("res://scene/game_menu.tscn")


func _on_player_controller_shoot() -> void:
	if gun.has_method("shoot"):
		gun.shoot(BULLET, get_global_mouse_position() - get_position())
