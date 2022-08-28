extends Node2D
class_name Weapon

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (PackedScene) var Bullet

onready var start_of_weapon = $StartOfWeapon
onready var end_of_weapon = $EndOfWeapon

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_direction():
	return (end_of_weapon.global_position - start_of_weapon.global_position).normalized()
