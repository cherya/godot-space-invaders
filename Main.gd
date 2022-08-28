extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = $Player
onready var bullet_manager = $BulletManager

# Called when the node enters the scene tree for the first time.
func _ready():
	player.connect("weapon_fired", bullet_manager, "handle_bullet_spawned")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
