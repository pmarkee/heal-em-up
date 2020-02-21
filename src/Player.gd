extends KinematicBody2D

signal shoot

var velocity: = Vector2.ZERO
var can_shoot: = false

var weapons = ["heal", "purge"]
var current_weapon = 0

func change_weapon() -> void:
    # Basically toggle between Heal and Purge
    current_weapon = 1 - current_weapon

func _physics_process(delta: float) -> void:
    if Input.is_action_pressed("up"):
        velocity.y = -300
    elif Input.is_action_pressed("down"):
        velocity.y = 300
    else:
        velocity.y = 0

    if Input.is_action_just_pressed("change_weapon"):
        change_weapon()

    if Input.is_action_just_pressed("shoot") and can_shoot:
        emit_signal("shoot")
        can_shoot = false

    move_and_slide(velocity)


func _on_ShootTimer_timeout() -> void:
    can_shoot = true

