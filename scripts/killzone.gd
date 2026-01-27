extends Area2D
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void: # here body refers to the body that entered our killzone area, and since the only body that enters there is our player, this body simply refers to our player.
	print("You died!")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
