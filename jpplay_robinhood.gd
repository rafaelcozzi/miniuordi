extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var pulando = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#980
signal morri

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		pulando = true
	elif is_on_floor():
		pulando = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	
	if is_on_floor():
		if pulando:
			$AnimatedSprite2D.play("jump")
		elif direction !=0:
			$AnimatedSprite2D.play("run")
		elif direction == 0:
			$AnimatedSprite2D.play("idle")
	else:
		if velocity.y <0: 
			$AnimatedSprite2D.play("jump")
		else:
			$AnimatedSprite2D.play("fall")
			
	
	move_and_slide()	
	
func _levouDano():
	print("Morri ;-;")
	emit_signal("morri")


