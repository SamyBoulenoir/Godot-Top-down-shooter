extends Node2D

const RUSH_BOYS = preload("res://scene/entity/ennemy/rush_boys.tscn")
const DROID_MELEE = preload("res://scene/entity/ennemy/droid_melee.tscn")
const MOTHER_SHIP = preload("res://scene/entity/ennemy/mother_ship.tscn")
var mob_list: Array = [DROID_MELEE, MOTHER_SHIP, RUSH_BOYS]
# Called when the node enters the scene tree for the first time.
var rng = RandomNumberGenerator.new()
func _ready():
	var my_random_number = rng.randf_range(-10.0, 10.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var choosed_mob = mob_list[choose_random_mob()]
	var new_mob = choosed_mob.instantiate()
	for game in get_tree().get_nodes_in_group("Plateau de jeu"):
		game.add_child(new_mob)
	new_mob.global_position = global_position

func choose_random_mob() -> int:
	return rng.randi_range(0, mob_list.size() -1) 
