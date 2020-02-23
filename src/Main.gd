extends Node

export (PackedScene) var Rat
export (PackedScene) var Villager

export (PackedScene) var Heal
export (PackedScene) var Purge

var vp_size = Vector2(1280, 720)
var mob_spawn_x = vp_size.x - 20

func _ready():
    print(vp_size)

func _on_Player_shoot():
    var weapon = Heal if $Player.current_weapon == 1 else Purge
    var shot = weapon.instance()
    shot.position.x = $Player.position.x + 10
    shot.position.y = $Player.position.y
    add_child(shot)

func _on_Villager_die(score_to_give):
    global.score += score_to_give
    print(global.score)

func _on_Player_die():
    get_tree().change_scene("res://scene/GameOverScreen.tscn")

func _on_Rat_die():
    global.score += 1
    print(global.score)

func _on_RatTimer_timeout():
    randomize()
    var rat = Rat.instance()
    rat.position.x = mob_spawn_x
    rat.position.y = randi() % 700 + 10
    add_child(rat)
    rat.connect("die", self, "_on_Rat_die")
    $RatTimer.start(randi() % 3 + 1)

func _on_VillagerTimer_timeout():
    randomize()
    var villager = Villager.instance()
    villager.position.x = mob_spawn_x
    villager.position.y = randi() % 700 + 10
    add_child(villager)
    villager.connect("die", self, "_on_Villager_die")
    $VillagerTimer.start(randi() % 3 + 1)
