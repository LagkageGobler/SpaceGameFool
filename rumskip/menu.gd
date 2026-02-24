extends Control
#quits game
func _on_quit_pressed() -> void:
	get_tree().quit()
#button that takes you to info
func _on_info_pressed() -> void:
	get_tree().change_scene_to_file("res://Info.tscn") 
#button that takes you to game
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://moon an starsky.tscn")
