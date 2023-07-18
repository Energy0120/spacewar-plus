class_name Mondo extends Node2D

@onready var player = $Player	
@onready var opponent = $Oppponent
@onready var pro = $Proiettili
@onready var stella = $Stella
@onready var ohealth = $"Camera2D/Opponent Health"
@onready var phealth = $"Camera2D/Player Health"
var playing = true

func _ready():
	player.connect("sparo", sparato)
	opponent.connect("sparo", sparato)
	stella.connect("esploso", reduce_health)
	

func sparato(laser):
	UiSounds.play("laser_shot")
	pro.add_child(laser)
	pro.get_child(-1).connect("colpito", reduce_health)
	

func reduce_health(array):
	var tween = create_tween()
	var corpo = array[0]
	var damage = array[1]
	#var laser = array[2]
	var bar = phealth
	if corpo == opponent:
		bar = ohealth
	tween.tween_property(bar, "value", bar.value-damage, 0.6).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	if bar.value - damage <= 0:
		morte(corpo)
		if playing:
			playing = false
			if corpo == $Player:
				$Camera2D.victory($Oppponent)
			else:
				$Camera2D.victory($Player)
	else:
		SfxController.colpito(corpo.global_position, (corpo.global_position - pro.get_child(-1).global_position).normalized())
		UiSounds.play("hit")

func morte(corpo):
	SfxController.esplodi(corpo.global_position)
	corpo.queue_free()
	UiSounds.play("death")
	print("morto")
	
func _process(delta):
	var oggetti = [player, opponent]
	var oggettiToRemove = []
	
	for entità in oggetti:
		if entità != null and !entità.is_queued_for_deletion():
			var direction = (stella.global_position - entità.global_position).normalized()
			var distance = entità.global_position.distance_to(stella.global_position)
			var forza = stella.gravity*10/distance
			var accel = direction*forza*delta
			entità.velocity+=accel
		else:
			oggettiToRemove.append(entità)
	
	for entitàToRemove in oggettiToRemove:
		oggetti.erase(entitàToRemove)
