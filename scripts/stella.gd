class_name Stella extends Area2D

signal esploso()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer2.play("default")


func _on_body_entered(body):
	body.queue_free()
	emit_signal("esploso", [body, 100])



func _on_area_entered(area):
	area.queue_free()
