extends Control

func _ready():
	$VBoxContainer/Master_Slider.grab_focus()
	$VBoxContainer/Master_Slider.value = UiSounds.master_volume
	$VBoxContainer/Musica_Slider.value = UiSounds.music_volume
	$VBoxContainer/SFX_Slider.value = UiSounds.sfx_volume
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		UiSounds.play("click")
		get_tree().change_scene_to_file("res://scene/opzioni.tscn")


func _on_master_slider_value_changed(value):
	UiSounds.volume_control("Master", value)


func _on_indietro_pressed():
	UiSounds.play("click")
	get_tree().change_scene_to_file("res://scene/opzioni.tscn")


func _on_musica_slider_value_changed(value):
	UiSounds.volume_control("Musica", value)


func _on_sfx_slider_value_changed(value):
	UiSounds.volume_control("SFX", value)
