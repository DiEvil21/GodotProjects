extends KinematicBody2D



export(float) var character_speed = 200.0
var path = []
var click = false
var agressive
var target = Vector2()
var last_point = Vector2()
onready var nav = get_node("../Navigation2D")
onready var player = get_node("../player")

enum {
	PASSIVE,
	AGRESSIVE
}
var state = PASSIVE
func _input(event):
	if event.is_action_pressed("click"):
		click = true

func _physics_process(delta):
	
	look_at(last_point)
	if state == AGRESSIVE:
		_update_navigation_path(position, player.position)
		# включить если нужно, чтобы остановился там где видел игрока в первый раз
		#agressive= false
		var walk_distance = character_speed * delta
		move_along_path(walk_distance)
		move_and_slide(Vector2())






func move_along_path(distance):
	last_point = position
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])
		# The position to move to falls between two points.
		if distance <= distance_between_points:
			position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			return
		# The position is past the end of the segment.
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)
	# The character reached the end of the path.
	position = last_point
	set_process(false)


func _update_navigation_path(start_position, end_position):
	# get_simple_path is part of the Navigation2D class.
	# It returns a PoolVector2Array of points that lead you
	# from the start_position to the end_position.
	path = nav.get_simple_path(start_position, end_position, true)
	# The first point is always the start_position.
	# We don't need it in this example as it corresponds to the character's position.
	path.remove(0)
	set_process(true)


func _on_Area2D_area_entered(area):
	state = AGRESSIVE


