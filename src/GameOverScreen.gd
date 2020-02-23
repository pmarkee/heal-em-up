extends Control

func _ready():
    $VBoxContainer/ScoreLabel.text = "Your score: %d" % global.score
    for button in $VBoxContainer/Menu.get_children():
        button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_Button_pressed(scene_to_load):
    get_tree().change_scene(scene_to_load)
