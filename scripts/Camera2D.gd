extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func victory(winner):
	$"..".playing = false
	UiSounds.victory()
	var winner_name = winner.player_name
	var last_position = winner.global_position
	await get_tree().create_timer(2).timeout
	if winner != null and !winner.is_queued_for_deletion():
		last_position = winner.global_position
	get_tree().paused = true
	$"Game Over".visible = true
	$"Game Over/VBoxContainer/Riprova".grab_focus()
	$"Game Over"/Label.text = ("Il "+winner_name+" Ha vinto!")
	var tween = create_tween()
	tween.tween_property(self, "zoom", zoom*1.4, 0.6).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(self, "position", Vector2(last_position.x+250, last_position.y), 0.6).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		
func tie():
	$"..".playing = false
	UiSounds.victory()
	get_tree().paused = true
	$"Game Over".visible = true
	$"Game Over/VBoxContainer/Riprova".grab_focus()
	$"Game Over"/Label.text = "Pareggio!"
	$"Game Over".scale *= 1.5
	$"Game Over".position.x = -90
	$"Game Over".position.y = 40
	
func time_up():
	if $"Player Health".value > $"Opponent Health".value:
		victory($"../Player")
	elif $"Player Health".value < $"Opponent Health".value:
		victory($"../Oppponent")
	else:
		(tie())
	
func _on_riprova_pressed():
	UiSounds.find_child("victory").stop()
	get_tree().reload_current_scene()
	get_tree().paused = false


func _on_vai_al_menu_pressed():
	UiSounds.find_child("victory").stop()
	get_tree().change_scene_to_file("res://scene/menu.tscn")
	get_tree().paused = false


func _on_esci_dal_gioco_pressed():
	get_tree().quit()
