extends Spatial

var road_res = preload("res://road.tscn")
var aCar_res = preload("res://aCar.tscn")
var CarAfter_res = preload("res://carAfter.tscn")
var road1 = road_res.instance()
var road2 = road_res.instance()
var road3 = road_res.instance()
var aCar = aCar_res.instance()
var carAfter = CarAfter_res.instance()
var score = 0
var timer
var but
const SPEED = 300
func _ready():
	road1.set_translation(Vector3(0,0,0))
	road2.set_translation(Vector3(30,0,0))
	road3.set_translation(Vector3(60,0,0))
	aCar.set_translation(Vector3(25,0,0))
	carAfter.set_translation(Vector3(37,0,0))
	timer = Timer.new()
	add_child(road1)
	add_child(road2)
	add_child(road3)
	add_child(aCar)
	add_child(carAfter)
	add_child(timer)
	


func _physics_process(delta):
	$RichTextLabel.set_text(String(score))

	if but:
		
		road1.speed = lerp(0,SPEED,0.5)
		road2.speed = road1.speed
		road3.speed = road1.speed
		aCar.speed = road1.speed
		carAfter.speed = road1.speed
		print(carAfter.speed,"    ",aCar.speed )
		
		
	else:
		road1.speed = lerp(road1.speed,0,0.05)
		road2.speed = road1.speed
		road3.speed = road1.speed
	if road1.get_translation().x < 0:
		road1.set_translation(Vector3(90,0,0))
		score+=1
	if road2.get_translation().x < 0:
		road2.set_translation(Vector3(90,0,0))
		score+=1
	if road3.get_translation().x < 0:
		road3.set_translation(Vector3(90,0,0))
		score+=1




func car_after_start():
	timer.autostart = true
	timer.wait_time = 10
	timer.connect("timeout", self, "_timeout")
	





func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			but = 1
			aCar.but = but
			carAfter.but = but
		else:
			but = 0
			aCar.but = but
			carAfter.but = but



