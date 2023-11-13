class_name Player
extends CharacterBody2D


@onready var animated_sprite_2d = $AnimatedSprite2D

@export var speed := 100.0
@export var accel := 800.0

var direction: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	direction = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	
	velocity = velocity.move_toward(direction * speed, accel * delta)
	
	_update_animation()
	
	move_and_slide()


func _update_animation():
	if direction == Vector2.ZERO:
		animated_sprite_2d.play("Idle")
		return
	
	animated_sprite_2d.play("Run")
	
	if direction.x != 0:
		animated_sprite_2d.flip_h = direction.x < 0 
