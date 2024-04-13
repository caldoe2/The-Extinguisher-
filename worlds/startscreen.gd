extends Node2D

func _on_quitbutton_pressed():
	print("pressed")
	get_tree().quit()	

func _on_playbutton_pressed():
	print("pressed")
	get_tree().change_scene_to_file("res://worlds/homeworld.tscn")
	pass
