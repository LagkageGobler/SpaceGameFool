extends CharacterBody2D

var Sidethrust = 0
var Thrust = 0
const Gravity = 10

func _ready() -> void:
	velocity.x += randf_range(-50,60)

func _physics_process(delta: float) -> void:
	velocity.y += delta * Gravity
	velocity += Vector2(0,-Thrust)
	move_and_slide()
	
	if Input.is_action_just_pressed("Thrust"):
		Thrust += 10
	if Input.is_action_just_pressed("Dethrust") and Thrust >= 0:
		Thrust -= 10
	if Input.is_action_just_pressed("Rightthrust"):
		rotation_degrees += 10
