extends KinematicBody2D

var velocity: = Vector2.ZERO
var can_shoot: = false

func shoot():
	print("Shoot")

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		velocity.y = -300
	elif Input.is_action_pressed("down"):
		velocity.y = 300
	else:
		velocity.y = 0
	
	if Input.is_action_just_pressed("shoot") and can_shoot:
		shoot()
		can_shoot = false
	
	move_and_slide(velocity)


func _on_ShootTimer_timeout() -> void:
	can_shoot = true

