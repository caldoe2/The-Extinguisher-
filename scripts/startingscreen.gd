extends Node2D

func _on_quitbutton_pressed():
	get_tree().quit()	
	
func _on_startbutton_pressed():
	get_tree().change_scene_to_file("res://world nodes/world.tscn")
	pass
