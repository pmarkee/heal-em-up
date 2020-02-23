extends Control

func _ready():
    var button = $Menu/StartMenuButton
    button.connect("pressed", self, "_on_StartMenuButton_pressed", [button.scene_to_load])

func _on_StartMenuButton_pressed(scene_to_load):
    get_tree().change_scene(scene_to_load)
