extends Label

@onready var time
@onready var working = true
func _ready():
	if SfxController.tempo_illimitato:
		set_process(false)
		text = '\u221E'
	time = 101
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"../..".playing:
		time -= delta
		text = str(int(time))
		if text == "0":
			$"..".time_up()
