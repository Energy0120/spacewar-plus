extends Node2D

@onready var projectiles_mass = false
@onready var tempo_illimitato = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	for i in $Node.get_children():
		if i.emitting == false:
			i.queue_free()

func esplodi(posizione):
	var effetto = $Esplosione.duplicate()
	effetto.position = posizione
	effetto.emitting = true
	$Node.add_child(effetto)

func colpito(posizione, rotazione):
	var effetto = $Colpito.duplicate()
	effetto.position = posizione
	effetto.rotation = rotazione.angle()
	print(effetto.rotation)
	effetto.emitting = true
	$Node.add_child(effetto)


func _on_main_tree_exiting():
	$Stars.emitting = false
	UiSounds.find_child("bgm").stop()


func _on_main_tree_entered():
	$Stars.emitting = true
	UiSounds.find_child("bgm").play()
