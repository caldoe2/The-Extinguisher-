extends StaticBody2D

#$AnimatedSprite.frame = 0

func launch():
	$CollisionShape2D/AnimatedSprite2D.frame = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D/AnimatedSprite2D.frame = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
