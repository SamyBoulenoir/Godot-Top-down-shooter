extends CharacterBody2D

@onready var velocity_and_direction: Node2D = $VelocityAndDirection
@onready var hitbox_component: Area2D = $HitboxComponent

var mask: int = 0   # Valeur par défaut (à modifier selon le gun)
var layer: int = 0  # Valeur par défaut (à modifier selon le gun)

var final_bullet_direction: Vector2 = Vector2.ZERO

func direction(bullet_direction: Vector2):
	final_bullet_direction = bullet_direction

func _ready() -> void:
	hitbox_component.set_collision_mask_value(mask, true)
	hitbox_component.set_collision_layer_value(layer, true)

func _physics_process(_delta: float) -> void:
	velocity_and_direction.change_direction(final_bullet_direction)
	velocity_and_direction.move(self)

func _on_timer_timeout() -> void:
	queue_free()


func _on_hitbox_component_area_entered(_area: Area2D) -> void:
	queue_free()
