extends Node2D
@onready var hero: CharacterBody2D = $Hero

func _ready() -> void:
	for enemy in get_tree().get_nodes_in_group("Méchant"):
		enemy.has_method("on_hero_position_changed")
		hero.position_changed.connect(enemy.on_hero_position_changed)

func _process(_delta: float) -> void:
	pass


func _on_child_entered_tree(node: Node) -> void:
	if hero and node.has_method("on_hero_position_changed"):
		hero.position_changed.connect(node.on_hero_position_changed)
