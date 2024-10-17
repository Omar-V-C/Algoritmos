extends CharacterBody2D
class_name character

@onready var gun = preload("res://Scenes/Character/Gun/gun_default.tscn")

@export var speed = 140
@export var maxSpeed = 140
@export var initialSpeed = 0
@export var acceleration = 0
var direction

func _process(delta: float) -> void:
	movement()

func _physics_process(delta: float) -> void:
	move_and_slide()

func movement():
	direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction * speed
	
func _ready() -> void:
	var gunInstance = gun.instantiate()
	
	add_child(gunInstance)
