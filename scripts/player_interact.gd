extends Area2D

#script for interaction here
var interact = false 
var current_object 

func _process(_delta):
	if interact:
		if Input.is_action_just_pressed("interact"):
			print("you just interacted with " + current_object.name)

func _on_body_entered(body):
	if body.is_in_group("Interactables"):
		interact = true
		current_object = body

func _on_body_exited(_body):
	interact = false
