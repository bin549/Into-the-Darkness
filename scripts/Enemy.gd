extends KinematicBody2D

const gravity = 2000
export var max_speed = 50
export var acceleration = 50 / 0.2
export var is_dead = false
var velocity := Vector2.ZERO
onready var sprite: AnimatedSprite = $Sprite
onready var animation_player = $AnimationPlayer

func _on_Hurtbox_hurt(hitbox):
	if not hitbox.instant_kill and animation_player.has_animation("death"):
		animation_player.play("death")
	else:
		queue_free()

func _on_VisibilityEnabler2D_viewport_entered(_viewport):
	var enabler = $VisibilityEnabler2D
	enabler.process_parent = false
	enabler.physics_process_parent = false
	enabler.pause_animations = false
