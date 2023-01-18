extends Spatial


var roadSpeed
var car = load('res://second_scenes/cars/car1.tscn')
#initialize car prefabs
var carr = car.instance()
var carr2 = car.instance()
var carr3 = car.instance()
var carr4 = car.instance()
var carr5 = car.instance()





func _ready():
	
	car_spawn() 





func _physics_process(delta):
	pass




func car_spawn():
	carr.set_translation(Vector3(0,0,0))
	add_child(carr)
	carr2.set_translation(Vector3(0,5,1))
	add_child(carr2)
	carr3.set_translation(Vector3(0,10,1))
	add_child(carr3)
	carr4.set_translation(Vector3(0,15,1))
	add_child(carr4)
	carr5.set_translation(Vector3(0,20,1))
	add_child(carr5)
	

	
	
	
	
