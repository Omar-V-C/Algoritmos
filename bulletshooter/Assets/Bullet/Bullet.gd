class_name Bullet
extends CharacterBody2D

@export var initialSpeed = 240
@export var maxSpeed = 240
@export var acceleration = 0.0
@export var lifeSpam = 3
@export var damage = 0

var speed = initialSpeed
var direction: Vector2

func _ready() -> void:
	direction = Input.get_vector("Shoot_left","Shoot_right","Shoot_up","Shoot_down")
	
	$".".rotation_degrees = bulletAngle(direction)+90
	
	await get_tree().create_timer(lifeSpam).timeout
	await _before_lifeSpam_bullet_expire()
	queue_free()
	
func bulletAngle(direction):
	
	var radians = atan2(direction.y,
						direction.x)
	var angle = rad_to_deg(radians)
	return angle

func _physics_process(delta: float) -> void:
	speed = lerp(initialSpeed,maxSpeed,acceleration*delta)
	velocity = direction*speed*delta
	var collision = move_and_collide(velocity)
	
func _process(delta: float) -> void:
	pass
	
func _before_lifeSpam_bullet_expire():
	pass
