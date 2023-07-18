extends Node

@onready var master_volume : float
@onready var music_volume : float
@onready var sfx_volume : float

func _ready():
	master_volume = 1
	music_volume = 1
	sfx_volume = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play(sound : String):
	self.find_child(sound).play()

func victory():
	$bgm.stop()
	$victory.play()

func volume_control(bus_name, value):
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index(bus_name), linear_to_db(value)
	)
	if bus_name == "Master":
		master_volume = value
	elif bus_name == "Musica":
		music_volume = value
	else:
		sfx_volume = value
