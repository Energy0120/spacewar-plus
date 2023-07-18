extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if(UiSounds.find_child("title").playing == false):
		UiSounds.play("title")
	$VBoxContainer/Start.grab_focus()
	$"Title Movement".play("menu_animations/Title_movement")
	$AnimationPlayer.play("focus movement")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	UiSounds.play("start")
	UiSounds.find_child("title").stop()
	get_tree().change_scene_to_file("res://scene/main.tscn")


func _on_quit_pressed():
	UiSounds.play("click")
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()


func _on_options_pressed():
	UiSounds.play("menu_sound")
	get_tree().change_scene_to_file("res://scene/opzioni.tscn")


func _on_start_focus_entered():
	$VBoxContainer/Start/Sprite2D.visible = true


func _on_start_focus_exited():
	$VBoxContainer/Start/Sprite2D.visible = false


func _on_options_focus_entered():
	$VBoxContainer/Options/Sprite2D.visible = true


func _on_options_focus_exited():
	$VBoxContainer/Options/Sprite2D.visible = false


func _on_quit_focus_entered():
	$VBoxContainer/Quit/Sprite2D.visible = true


func _on_quit_focus_exited():
	$VBoxContainer/Quit/Sprite2D.visible = false
