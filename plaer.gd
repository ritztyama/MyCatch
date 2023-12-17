extends Area2D

@export var speed = 200
var score
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	print("start")
	screen_size = get_viewport_rect().size


func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
		rotation = 90
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		rotation = -90

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_body_entered(body):
	print("thit")
