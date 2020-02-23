extends Node2D

const heal_png = "res://assets/heal_large.png"
const purge_png = "res://assets/purge_large.png"

onready var player = $GameArea/Player

func _ready():
    global.lives = 5
    global.score = 0
    update_score_label()
    update_lives_label()
    player.connect("change_weapon", self, "_on_Player_change_weapon")
    player.connect("injure", self, "_on_Player_injure")

func _on_Player_change_weapon():
    $HUD/StatBar/CurrentWeapon.texture = load(heal_png if player.current_weapon == 1  else purge_png)

func _on_Player_injure():
    update_lives_label()

func _on_GameArea_score_change():
    update_score_label()

func update_lives_label():
    $HUD/StatBar/LivesLabel.text = "Lives: %d" % global.lives

func update_score_label():
    $HUD/StatBar/ScoreLabel.text = "Score: %d" % global.score

