extends Area2D

#$AnimatedSprite.frame = 0
var launching = 0
func launch():
	$CollisionShape2D2/AnimatedSprite2D.frame = 1
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D2/AnimatedSprite2D.frame = 0
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
	#if launching:
		#velocity.y = 100
	#else:
		#velocity.y = 0
	#pass
