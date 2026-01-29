extends Area2D
@onready var timer: Timer = $Timer
# @onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
#var die: = 0
# signal player_died

func _on_body_entered(body: Node2D) -> void: # here body refers to the body that entered our killzone area, and since the only body that enters there is our player, this body simply refers to our player.
	#die = 1
	#die()
	Engine.time_scale = 0.5
	# body.get_node("CollisionShape2D").queue_free()
	# timer.start()
	# if body.is_in_group("Player"):
	if body.has_method("die"):
		body.die()
	# emit_signal("player_died")
'''
func die():
	animated_sprite_2d = animated_sprite_2d.play("die")
	if animated_sprite_2d != null:
		animated_sprite_2d.play("die")
	else:
		print("Animation player is missing!")
	print("you died")
'''

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
