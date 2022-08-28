extends Area2D
class_name Bullet

export (int) var speed = 150
var direction := Vector2.ZERO
onready var kill_timer = $KillTimer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	kill_timer.start()

func _physics_process(delta: float) -> void:
	if self.direction != Vector2.ZERO:
		var velocity = self.direction * speed
		global_position += velocity


func fire(dir: Vector2):
	self.direction = dir


func _on_KillTimer_timeout():
	queue_free()
