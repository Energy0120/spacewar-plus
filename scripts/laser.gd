class_name Laser extends Area2D

signal esploso()
signal colpito(damage)

var mov = Vector2(0, -1)
var vel = 500

func _process(delta):
	global_position += mov.rotated(rotation) * vel * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body is Opponent:
		emit_signal("colpito", [body, 34])
		queue_free()
	

func _on_area_entered(_area):
	queue_free()
