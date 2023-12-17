extends Area2D
signal catch
var prev_position


# Called when the node enters the scene tree for the first time.
func _ready():
	prev_position = position
	show()
	var items_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(items_types[randi() % items_types.size()])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 10


func go_to_item_positon():
	position += prev_position


func _on_body_entered(body):
	print("hit")
	hide()
	catch.emit()
	go_to_item_positon()
