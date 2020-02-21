extends KinematicBody2D

var velocity = Vector2.RIGHT * 300

func _physics_process(delta: float) -> void:
    move_and_slide(velocity)
