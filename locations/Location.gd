extends Node2D

@export var data: LocationData
@onready var player: CharacterBody2D = $Player

func _ready() -> void:
	data.player = player
	data.player.position = data.entrance.get_location()
