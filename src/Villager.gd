extends Area2D

signal die

var velocity = Vector2.LEFT * 2
var is_sick = true

func _ready():
    add_to_group("villagers")

func _physics_process(delta):
    position += velocity

func _on_Villager_area_entered(area):
    if area.is_in_group("heal"):
        $AnimatedSprite.set_frame(0)
        is_sick = false
    elif area.is_in_group("purge"):
        queue_free()
        emit_signal("die", 0 if is_sick else -1)
    elif area.is_in_group("rats"):
        $AnimatedSprite.set_frame(1)
        is_sick = true

func _on_VisibilityNotifier2D_screen_exited():
    emit_signal("die", -1 if is_sick else 1)
    queue_free()
