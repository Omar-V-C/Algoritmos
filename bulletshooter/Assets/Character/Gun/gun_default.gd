extends Node2D
class_name Gun
var direction: Vector2
var bullet_on_air:bool = false
var cooldown:bool = false

@onready var bullet = preload("res://Scenes/Bullet/Default_Bullet.tscn")

func _ready() -> void:
	$Sprite2D.rotation_degrees = 90

func _process(delta: float) -> void:
	$Sprite2D.rotation_degrees = rotationUpdate() - 90
	if Input.get_vector("Shoot_left","Shoot_right","Shoot_up","Shoot_down"):
		shoot()
	cooldown = false
	
func rotationUpdate():
	direction = Input.get_vector(
		"Shoot_left",
		"Shoot_right",
		"Shoot_up",
		"Shoot_down")
	var radians = atan2(direction.y,
						direction.x)
	var angle = rad_to_deg(radians)
	return angle

func shoot():
	if cooldown == true:
		cooldown = false
		var bulletInstance = bullet.instantiate()
		get_tree().root.add_child(bulletInstance)
		var character_escene:Vector2 = get_tree().get_root().get_node("./Character").position
		bulletInstance.position = character_escene
		
func _on_timer_timeout() -> void:
	cooldown = true
	pass
