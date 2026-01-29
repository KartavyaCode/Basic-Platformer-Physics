extends Area2D
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void: # here body refers to the body that entered our killzone area, and since the only body that enters there is our player, this body simply refers to our player.
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	# if body.is_in_group("Player"):
	if body.has_method("die"):
		body.die()
	# emit_signal("player_died")

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
