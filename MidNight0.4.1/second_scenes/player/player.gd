extends KinematicBody


var touch 
var turnLeft
var turnRight
var vel = Vector3()
var projectResolutionx = 1280
func _ready():
	projectResolutionx = get_viewport().size.x
	load_game()
	pass 


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		if touch < projectResolutionx/3:
			vel.x += 1
		elif touch > (projectResolutionx/3) * 2:
			vel.x -= 1
	move_and_slide(vel,Vector3.UP)
	vel.x = lerp(vel.x,0,0.2)
	#print(projectResolutionx)
	
func _input(event):
	if not event is InputEventScreenTouch:
		return
	print(event.get_position())
	if event.pressed:
		Input.action_press("ui_right")
	else:
		Input.action_release("ui_right")
	touch = event.get_position().x
func hit():
	
	
	var scene = load ('res://menu.tscn')
	get_tree().change_scene_to(scene)
	
func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.filename.empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("save")

		# Store the save dictionary as a new line in the save file.
		save_game.store_line(to_json(node_data))
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.

	# We need to revert the game state so we're not cloning objects
	# during loading. This will vary wildly depending on the needs of a
	# project, so take care with this step.
	# For our example, we will accomplish this by deleting saveable objects.
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()

	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		# Get the saved dictionary from the next line in the save file
		var node_data = parse_json(save_game.get_line())

		# Firstly, we need to create the object and add it to the tree and set its position.
		var new_object = load(node_data["filename"]).instance()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])

		# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])

	save_game.close()
