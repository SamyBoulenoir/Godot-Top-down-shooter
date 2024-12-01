extends Area2D

@export var health_componant: HealthComponent
@export var initial_damage_dealt: int = 10
# Called when the node enters the scene tree for the first time.

var damage_dealt = initial_damage_dealt
func _ready() -> void:
	self.area_entered.connect(get_hit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func get_hit(_area):
	if health_componant != null:
		health_componant.take_damage(_area.damage_dealt)
