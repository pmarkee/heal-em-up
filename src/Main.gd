extends Node

export (PackedScene) var Rat
export (PackedScene) var Villager

export (PackedScene) var Heal
export (PackedScene) var Purge

var score = 0
var mob_spawn_x = 1900

func _on_Player_shoot():
    var weapon = Heal if $Player.current_weapon == 1 else Purge
    var shot = weapon.instance()
    shot.position.x = $Player.position.x + 10
    shot.position.y = $Player.position.y
    add_child(shot)

func _on_Villager_die(score_to_give):
    score += score_to_give

func _on_Player_die():
    print("Game over")

func _on_Rat_die():
    score += 1

func _on_RatTimer_timeout():
    randomize()
    var rat = Rat.instance()
    rat.position.x = mob_spawn_x
    rat.position.y = randi() % 1000 + 10
    add_child(rat)
    $RatTimer.start(randi() % 7 + 3)

func _on_VillagerTimer_timeout():
    randomize()
    var villager = Villager.instance()
    villager.position.x = mob_spawn_x
    villager.position.y = randi() % 1000 + 10
    add_child(villager)
    $VillagerTimer.start(randi() % 7 + 3)
