extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") and $"../..".playing:
		gestore()

func _on_riprendi_pressed():
	UiSounds.play("menu_close")
	gestore()
	
func _on_ricomincia_pressed():
	UiSounds.play("click")
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_esci_pressed():
	get_tree().paused = false
	UiSounds.play("click")
	get_tree().change_scene_to_file("res://scene/menu.tscn")

func gestore():
	if visible == false:
		#visible = true
		UiSounds.play("menu_sound")
		$AnimationPlayer.play("pausa")
		$ColorRect/Panel/VBoxContainer/Riprendi.grab_focus()
	else:
		UiSounds.play("menu_close")
		$AnimationPlayer.play("riprendi")
		await get_tree().create_timer(0.13).timeout
	visible = not visible
	get_tree().paused = visible


func _on_esci_dal_gioco_pressed():
	get_tree().quit()
