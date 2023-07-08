extends CharacterBody2D

var dialogue = preload("res://dialogue.tscn")
@export var move_speed : float = 1000
@export var starting_direction : Vector2 = Vector2(0,1)
@export var jump_impulse = 1000
@export var vec = Vector2(1000,1000)

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
const GRAVITY = 20
	

func _ready():
	update_animation_parameters(starting_direction)
	var d = dialogue.instantiate()
	d.messages = ["I did it!", "And now I can\nmove every\n direction", "I love waffles"]
	
	add_child(d)
func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)


	
	
	
	velocity = input_direction * move_speed
	
	move_and_slide()
	pick_new_state()
func update_animation_parameters(move_input: Vector2):
	if(move_input != Vector2.ZERO  ) :
		animation_tree.set("parameters/doc_idle/blend_position", move_input)
		animation_tree.set("parameters/doc_run/blend_position", move_input)

func pick_new_state() :
	if (velocity != Vector2.ZERO):
		state_machine.travel("doc_run")
	else:
		state_machine.travel("doc_idle")




func _on_wall_body_entered(body):
	if (body.is_in_group("Player")):
		print("amongus")
		var d = dialogue.instantiate()
		d.messages = ["Oh look, a wall!"]
		add_child(d)
	
