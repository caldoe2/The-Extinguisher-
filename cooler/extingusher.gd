extends Node2D

const SPEED = 400
const MAX_DISTANCE = 1500
var start_position = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = self.position  # Save the starting position of the bullet

func _process(delta):
	if not $CPUParticles2D.emitting:
		$CPUParticles2D.emitting = true 
	
	self.position += self.transform.x * SPEED * delta
	# If the bullet has traveled beyond the max distance, queue it for deletion.
	if self.position.distance_to(start_position) > MAX_DISTANCE:
		queue_free()

