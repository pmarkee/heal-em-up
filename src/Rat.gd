extends Area2D

signal die

var velocity = Vector2.LEFT * 5

func _ready():
    add_to_group("rats")

# warning-ignore:unused_argument
func _physics_process(delta):
    position += velocity

func _on_Rat_area_entered(area):
    if area.is_in_group("purge"):
        emit_signal("die")
        queue_free()

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()
