extends Control


#takes you menu
func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")

#starts game again
func _on_go_agen_pressed() -> void:
	get_tree().change_scene_to_file("res://moon an starsky.tscn")
