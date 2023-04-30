extends Node2D
class_name head

@onready var tail_scene = preload("res://tscn/tail.tscn")

@onready var tails = []

var last_vector = Vector2.RIGHT
var vector = Vector2.ZERO
var previous_position = Vector2(275,275)

func _process(delta):
	var _vector = Vector2(Input.get_axis("ui_left","ui_right"),Input.get_axis("ui_up","ui_down"))
	
	if _vector != Vector2.ZERO:
		vector = _vector

func _tick():
	if tails.size() > 1:
		if position_snap(position + vector * 50) == previous_position:
			vector = last_vector
		else:
			last_vector = vector
	
	previous_position = position
	
	if vector.x != 0:
		position.x += vector.x * 50
	elif vector.y != 0:
		position.y += vector.y * 50
	
	position = position_snap(position)
	
	for apple in Singletone.apples:
		if apple != null:
			if position == apple.position:
				Singletone.apples.erase(Singletone.apples.find(apple))
				apple.queue_free()
				_apple()
				Singletone.score += 50
				Singletone.apple_sound.play()
				break

func _apple():
	var _tail = tail_scene.instantiate()
	
	if tails.size() <= 0:
		_tail.next_tail = self
	else:
		_tail.next_tail = tails[tails.size() - 1]
	
	tails.push_back(_tail)
	get_parent().add_child.call_deferred(_tail)
	
	_tail.color(Color(0.5 - (tails.size() * 0.1),0.5 - (tails.size() * 0.1),0.5 - (tails.size() * 0.1)))

func position_snap(_position : Vector2):
	var pos = _position
	
	if pos.x > 500:
		pos.x = 25
	elif pos.y > 500:
		pos.y = 25
	
	if pos.x < 0:
		pos.x = 475
	elif pos.y < 0:
		pos.y = 475
	
	return pos
