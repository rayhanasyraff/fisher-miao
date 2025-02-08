extends Area2D

class_name Fish

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position.x += 100.0 * delta
	
	if has_overlapping_bodies():
		queue_free()
		
	if position.x > 330:
		queue_free()

func _on_VisibleOnScreenNotifier2D_screen_exited():
	print('hello')
	queue_free()
