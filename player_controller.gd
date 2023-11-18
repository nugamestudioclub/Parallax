extends CharacterBody2D


@export var speed = 400

var interact = false # can the player interact with an item? (need to change to account for different items)

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()


func _process(delta):
	if interact:
		if Input.is_action_just_pressed("interact"):
			print ("you interacted!!")

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)


func _on_area_2d_body_entered(_body):
	interact = true


func _on_area_2d_body_exited(_body):
	interact = false
