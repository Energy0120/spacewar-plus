extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Audio.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		UiSounds.play("click")
		get_tree().change_scene_to_file("res://scene/menu.tscn")


func _on_indietro_pressed():
	UiSounds.play("click")
	get_tree().change_scene_to_file("res://scene/menu.tscn")


func _on_misc_pressed():
	UiSounds.play("menu_sound")
	get_tree().change_scene_to_file("res://scene/opzioni_misc.tscn")


func _on_audio_pressed():
	UiSounds.play("menu_sound")
	get_tree().change_scene_to_file("res://scene/opzioni_audio.tscn")
