extends Area2D

signal shoot
signal die
signal change_weapon
signal injure

var velocity: = Vector2.ZERO
var can_shoot: = false

var current_weapon = 0

func _physics_process(delta: float) -> void:
    if Input.is_action_pressed("up"):
        velocity.y = -10
    elif Input.is_action_pressed("down"):
        velocity.y = 10
    else:
        velocity.y = 0

    if Input.is_action_just_pressed("change_weapon"):
        change_weapon()

    if Input.is_action_just_pressed("shoot") and can_shoot:
        emit_signal("shoot")
        can_shoot = false

    position.y = clamp(position.y + velocity.y, 0, 1080)


func change_weapon() -> void:
    # Basically toggle between Heal and Purge
    current_weapon = 1 - current_weapon
    emit_signal("change_weapon")


func _on_ShootTimer_timeout() -> void:
    can_shoot = true


func _on_Player_area_entered(area):
    if area.is_in_group("rats"):
        global.lives -= 1
        emit_signal("injure")
    elif area.is_in_group("villagers"):
        if area.is_sick:
            emit_signal("injure")
            global.lives -= 1
    
    if global.lives == 0:
        emit_signal("die")
