extends CharacterBody2D

var Thrust = 0
const Gravity = 20

func _ready() -> void:
	velocity.x += randf_range(-500,600)

func _physics_process(delta: float) -> void:
	velocity.y += Gravity * delta
	velocity += Vector2.UP.rotated(rotation) * Thrust * delta
	move_and_slide()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Thrust") and Thrust <= 30:
		Thrust += 10
	elif Input.is_action_just_pressed("Dethrust") and Thrust >= 10:
		Thrust -= 10
	if Input.is_action_pressed("Rightthrust"):
		rotation_degrees += 1
	elif Input.is_action_pressed("Leftthrust"):
		rotation_degrees -= 1
		print(rotation_degrees)
		
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if velocity <= Vector2(100,100) and rotation_degrees < 15 and rotation_degrees > -15:
		get_tree().change_scene_to_file("res://win menu.tscn")
	else:
		get_tree().change_scene_to_file("res://lose_menu.tscn")
