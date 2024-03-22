extends Area2D

#script for interaction here
var interact = false 
var current_object 

func _unhandled_input(event):
	if Input.is_action_just_pressed("interact"):
		var interactables = get_overlapping_areas()
		if interactables.size() > 0:
			interactables[0].on_interact()
			return
