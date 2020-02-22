extends Area2D

var velocity = Vector2.RIGHT * 20

func _ready():
    add_to_group("purge")

func _physics_process(delta: float) -> void:
    position += velocity

func _on_Purge_area_entered(area):
    queue_free()

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()
