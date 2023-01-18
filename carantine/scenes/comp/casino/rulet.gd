extends Node2D


var rng = RandomNumberGenerator.new()
onready var rul = $rul
var rot = false
var number
var checkNumber = 0
var rorb = 3
var check
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if checkNumber == number:
		rot = false
	if rot == true:
		#rul.rotation = rul.rotation + 0.2085 * delta
		rul.rotate(3*delta)
		
	if rot == false:
		rul.rotate(0)
		checkNumber = 0
	

func randomIt(a,b):
	rng.randomize()
	return rng.randi_range(a, b)


func _on_Button_pressed():
	rorb = randomIt(1,18)
	number = randomIt(10,20)
	if rorb == 2:
		number = randomIt(2,8)
	if rot == false:
		rot = true
	print (randomIt(0,1))
	






func _on_red_area_exited(area):
	print('red')
	if rorb <= 8:
		checkNumber += 1
		print(checkNumber,'----------',number,'red')


func _on_black_area_exited(area):
	print('black')
	if  8 < rorb and  rorb < 17:
		checkNumber += 1
		print(checkNumber,'----------',number,'black')


func _on_green_area_exited(area):
	print('green')
	if rorb == 17:
		checkNumber += 1
		print(checkNumber,'----------',number,'green')
