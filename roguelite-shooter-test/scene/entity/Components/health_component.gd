extends Node2D

class_name HealthComponent

@export var MAX_HEALTH: int = 100
var health: int

func _ready() -> void:
	health = MAX_HEALTH

signal death()

func take_damage(damage: int):
	health -= damage
	if (health <= 0):
		death.emit()
