class_name Opponent extends CharacterBody2D

signal sparo(laser)

var player_name = "Giocatore 2"
var maxvel=200
var rotvel=150
const accel=300

var laser = preload("res://scene/laser2.tscn")

var cd = 25

func _process(delta):
	if cd>0:
		cd-=1
	elif (Input.is_action_pressed("Spara 2")):
		var l = laser.instantiate()
		l.global_position = $Fucile.global_position
		l.rotation = rotation
		emit_signal("sparo", l)
		cd = 25

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var mov = Vector2(0, Input.get_axis("accelerazione 2", "freni"))
	
	velocity += mov.rotated(rotation)*accel*delta
	velocity=velocity.limit_length(maxvel)
	rotate(deg_to_rad(rotvel*delta*(int(Input.is_action_pressed("Vira a destra 2"))-int(Input.is_action_pressed("Vira a sinistra 2")))))
	move_and_slide()
	
	var schermo = get_viewport_rect().size
	if global_position.y<0:
		global_position.y = schermo.y
	elif global_position.y>schermo.y:
		global_position.y = 0
	elif global_position.x<0:
		global_position.x = schermo.x
	elif global_position.x>schermo.x:
		global_position.x = 0
