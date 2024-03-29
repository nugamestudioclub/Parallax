extends StaticBody2D

@onready var player_entrance: Node2D = $PlayerEntrance

func _on_player_detection_area_entered(area: Area2D) -> void:
	print_debug("Player In Door Way")

func get_location():
	return player_entrance.position
