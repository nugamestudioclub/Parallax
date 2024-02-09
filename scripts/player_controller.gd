extends CharacterBody2D

@export var ACCEL: float  = 1600
@export var MAX_SPEED: float  = 400
@export var FRIC: float  = 1600
#@export var speed = 400
var screensize

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	screensize = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	input_handler(delta)
	move_and_slide()
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
func input_handler(delta: float) -> void:
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# Sprite Handling
	if input_direction.x < 0:
		sprite.flip_h = input_direction.x < 0
	elif input_direction.x > 0:
		sprite.flip_h = false
		
	# Movement Handling
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(MAX_SPEED * input_direction, ACCEL*delta)
		sprite.play()
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRIC*delta)
		sprite.stop()
	
	velocity.normalized()
#
#
#func _physics_process(delta):
	#get_input()
	#move_and_collide(velocity * delta)
