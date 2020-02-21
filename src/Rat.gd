extends KinematicBody2D

var velocity = Vector2.LEFT * 50

func _physics_process(delta):
    move_and_slide(velocity)
