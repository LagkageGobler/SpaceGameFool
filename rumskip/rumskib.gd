extends CharacterBody2D

var Thrust = 0
var Burn = 0
const Gravity = 25

func _ready() -> void:
	velocity.x += randf_range(-500,600)

func _physics_process(delta: float) -> void:
	velocity.y += Gravity * delta
	velocity += Vector2.UP.rotated(rotation) * Thrust * delta
	move_and_slide()


func _process(delta: float) -> void:
	if $CanvasLayer/Control/fuel.value > 0:
		if Input.is_action_just_pressed("Thrust") and Thrust <= 30:
			Thrust += 10
			Burn += 1
		elif Input.is_action_just_pressed("Dethrust") and Thrust >= 10:
			Thrust -= 10
			Burn -= 1
		if Input.is_action_pressed("Rightthrust"):
			rotation_degrees += 1
		elif Input.is_action_pressed("Leftthrust"):
			rotation_degrees -= 1
	else:
		Thrust = 0
	$CanvasLayer/Control/fuel.value -= Burn
	$"../CanvasLayer/Control/altitude".value = abs(position.y)
	
	$CanvasLayer/Control/velocityX.clear()
	$CanvasLayer/Control/velocityX.text += "velocity X:" + str(int(velocity.x))
	
	$CanvasLayer/Control/velocityY.clear()
	$CanvasLayer/Control/velocityY.text += "velocity Y:" + str(int(velocity.y))


func _on_area_2d_area_entered(area: Area2D) -> void:
	if velocity.x < 20 and velocity.y < 30 and rotation_degrees < 15 and rotation_degrees > -15:
		velocity = Vector2.ZERO
		$WTimer.start(0.3)
	else:
		velocity = Vector2.ZERO
		$LTimer.start(0.3)



func _on_l_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://lose_menu.tscn")


func _on_w_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://win menu.tscn")
