extends Control




func _on_quit_pressed() -> void:
	get_tree().quit()
	pass


func _on_info_pressed() -> void:
	get_tree().change_scene_to_file("res://Info.tscn")
	pass 
