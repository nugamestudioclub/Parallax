extends Area2D

#script for interaction here
var interact = false #going to change this to account for different objects next

func _process(_delta):
	if interact:
		if Input.is_action_just_pressed("interact"):
			print("you just interacted!!")

func _on_body_entered(_body):
	interact = true


func _on_body_exited(_body):
	interact = false
