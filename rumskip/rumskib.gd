extends CharacterBody2D

var Sidethrust = 0
var Thrust = 0
const Gravity = 1

func _ready() -> void:
	velocity.x += randf_range(-50,60)

func _physics_process(delta: float) -> void:
	velocity.y += Gravity
	velocity += Vector2.UP.rotated(rotation) * Thrust
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
	
