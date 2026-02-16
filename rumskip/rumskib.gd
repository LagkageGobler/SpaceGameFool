extends CharacterBody2D

const Gravity = 1

func _ready() -> void:
	velocity.x += randf_range(-50,60)

func _physics_process(delta: float) -> void:
	velocity.y += Gravity 
	move_and_slide()
	
