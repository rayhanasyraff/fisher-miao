extends CharacterBody2D

@onready var joystick = $"../Camera2D/Joystick"

var speed = 300

#func _process(delta):
	##print('hello')
	#pass

func _physics_process(delta):
	var _delta = delta
	var direction = joystick.posVector
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2(0,0)
		
	move_and_slide()
	
	# Screen clamping
	var screenSize =  get_viewport().get_visible_rect().size
	position.x = clamp(position.x, 0 , screenSize.x)
	position.y = clamp(position.y, 0 , screenSize.y)
	
	#var collision = move_and_collide(velocity * delta)
#
	#if collision:
		#velocity = velocity.bounce(collision.get_normal())
		#if collision.get_collider().has_method("hit"):
			#collision.get_collider().hit()
