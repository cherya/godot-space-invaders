extends KinematicBody2D

export (PackedScene) var Bullet
export (int) var speed = 150

onready var weapon = $Weapon
onready var weapon_cooldown_timer = $WeaponCooldownTimer

onready var player_animation = $AnimationPlayer

signal weapon_fired(bullet, position, direction)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Sprite").modulate = Color(0,1,0)

func _physics_process(delta: float) -> void:
	var movement_direction := Vector2.ZERO

	if Input.is_action_pressed("ui_left"):
		movement_direction.x = -1
	if Input.is_action_pressed("ui_right"):
		movement_direction.x = 1

	movement_direction = movement_direction.normalized()
	move_and_slide(movement_direction * speed)

func _input(event):
	if event.is_action_pressed("fire"):
		charge_fire()
	if event.is_action_released("fire"):
		fire()
		
func charge_fire():
	if weapon_cooldown_timer.is_stopped():
		player_animation.play("ChargeAttack")

func fire():
	if weapon_cooldown_timer.is_stopped():
		var bullet = Bullet.instance()
		var direction = weapon.get_direction()
		emit_signal("weapon_fired", bullet, weapon.global_position, direction)
		weapon_cooldown_timer.start()
		player_animation.play("Attack")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	player_animation.stop()
