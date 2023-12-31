extends CharacterBody2D


@export var speed = 400
var screensize

func _ready():
	screensize = get_viewport_rect().size

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)


func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
