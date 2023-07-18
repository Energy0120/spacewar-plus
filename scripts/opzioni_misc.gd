extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Indietro.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		UiSounds.play("click")
		get_tree().change_scene_to_file("res://scene/opzioni.tscn")


func _on_indietro_pressed():
	UiSounds.play("click")
	get_tree().change_scene_to_file("res://scene/opzioni.tscn")


func _on_check_button_toggled(button_pressed):
	print(button_pressed)
	SfxController.projectiles_mass = button_pressed

func _on_tempo_illimitato_toggled(button_pressed):
	SfxController.tempo_illimitato = button_pressed
