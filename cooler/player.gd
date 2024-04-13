extends CharacterBody2D


const speed = 300.0
const jump_velocity = -400.0
#var is_jumping = 0

# set default momentum
const def_momentum = 1
var momentum = def_momentum

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = jump_velocity # (momentum/4) * jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * momentum
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()	
	if Input.is_action_pressed("fire"):
		var mouse_pos = get_viewport().get_mouse_position()
		var angle = atan((position[1] - mouse_pos[1])/(position[0] - mouse_pos[0]))
		#print(position, mouse_pos, angle)
		#position = position - mouse_pos
		#sqrt((position[1] - mouse_pos[1])**2 + (position[0] - mouse_pos[0])**2)
		var ang_vector = Vector2(-cos(angle) * 100, -sin(angle) * 100)
		if position[0] < mouse_pos[0]:
			ang_vector = Vector2(cos(angle) * 100, sin(angle) * 100)
		#print(ang_vector)
		get_parent().get_node("test").global_position = position + ang_vector
		print(angle)
		var multiplier = 1
		if (ang_vector[0] < 0 and direction < 0) or (ang_vector[0] > 0 and direction >0):
			multiplier = 0.5
		else:
			multiplier = 2
		if direction:
			setMomentum(def_momentum*multiplier)
	#if Input.is_action_pressed("move_right"):
		#print("right")
		#velocity.x += momentum * delta
	#if Input.is_action_pressed("move_left"):
		#print("left")
		#velocity.x -= momentum
	#if Input.is_action_pressed("move_down"):
		#velocity.y += momentum
		#print("down")
	#if Input.is_action_pressed("move_up"):
		#
		#velocity.y -= momentum
	if Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left") or Input.is_action_just_released("move_down") or Input.is_action_just_released("move_up"):
		momentum = def_momentum

#func hydrant_process(delta):

func setMomentum(m):
	momentum = m
	
	
#var stop = 0
#func _process(delta):
	#var velocity = Vector2.ZERO # The player's movement vector.
	##momentum = 5
	#print(momentum)
	#if Input.is_action_pressed("fire"):
		#var mouse_pos = get_viewport().get_mouse_position()
		#var angle = atan((position[1] - mouse_pos[1])/(position[0] - mouse_pos[0]))
		##print(position, mouse_pos, angle)
		##position = position - mouse_pos
		##sqrt((position[1] - mouse_pos[1])**2 + (position[0] - mouse_pos[0])**2)
		#var ang_vector = Vector2(-cos(angle) * 100, -sin(angle) * 100)
		#if position[0] < mouse_pos[0]:
			#ang_vector = Vector2(cos(angle) * 100, sin(angle) * 100)
		##print(ang_vector)
		#get_parent().get_node("test").global_position = position + ang_vector
		#setMomentum(def_momentum*5)
	#if Input.is_action_pressed("move_right"):
		#velocity.x += momentum * delta
	#if Input.is_action_pressed("move_left"):
		#velocity.x -= momentum
	#if Input.is_action_pressed("move_down"):
		#velocity.y += momentum
		#print("down")
	#if Input.is_action_pressed("move_up"):
		#velocity.y -= momentum
	#if !Input.is_action_pressed("move_right") and !Input.is_action_pressed("move_left") and !Input.is_action_pressed("move_down") and !Input.is_action_pressed("move_up"):
		#momentum = def_momentum
	#
	
	
		
	#if velocity.length() > 0:
		#velocity = velocity.normalized() * SPEED
		#$AnimatedSprite2D.play()
	#else:
		#$AnimatedSprite2D.stop()
