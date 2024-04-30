extends CharacterBody2D

signal collided

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$Sprite2D.play('fly')
	set_physics_process(false)

func _physics_process(delta):
	rotation = clamp(velocity.y * delta * 0.1, -(PI/10), (PI/10))
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed('jump'):
		$WingAudio.play()
		velocity.y = JUMP_VELOCITY

	var collision = move_and_collide(velocity * delta)
	if collision:
		collided.emit()

func fly(init_position: Vector2):
	position = init_position
	velocity = Vector2()
	set_physics_process(true)
