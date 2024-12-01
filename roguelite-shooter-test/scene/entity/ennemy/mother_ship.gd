extends CharacterBody2D
class_name MotherShip
@onready var velocity_and_direction: Node2D = $VelocityAndDirection

const DROID_MELEE = preload("res://scene/entity/ennemy/droid_melee.tscn")
const RUSH_BOYS = preload("res://scene/entity/ennemy/rush_boys.tscn")

var player_position: Vector2 = Vector2.ZERO
@onready var marker_2d: Marker2D = $Marker2D
var mob_list: Array = [DROID_MELEE, RUSH_BOYS]

func _physics_process(_delta: float) -> void:
	velocity_and_direction.change_direction((player_position - get_position()).normalized())
	velocity_and_direction.move(self)

func on_hero_position_changed(new_player_position: Vector2) -> void:
	player_position = new_player_position


func _on_health_component_death() -> void:
	queue_free()

func _on_timer_timeout() -> void:
	var choosed_mob = mob_list[choose_random_mob()]
	var new_mob = choosed_mob.instantiate()
	for game in get_tree().get_nodes_in_group("Plateau de jeu"):
		game.add_child(new_mob)
	new_mob.global_position = marker_2d.global_position

func choose_random_mob() -> int:
	return randi_range(0, mob_list.size() -1) 
