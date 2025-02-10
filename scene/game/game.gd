extends Node2D

@export var fish_scene: PackedScene

@onready var label: Label = $LabelScore
@onready var timer: Timer = $Timer
#@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var	_score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_fish()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func spawn_fish() -> void:
	var new_fish: Fish = fish_scene.instantiate()
	var ypos: float = randf_range(100, 1000)
	new_fish.position = Vector2(30, ypos)
	
	new_fish.body_entered.connect(update_score)
	
	add_child(new_fish)

func _on_timer_timeout() -> void:
	spawn_fish()

func update_score(_body: Node2D) -> void:
	_score += 1
	label.text = "%05d" % _score
	#audio_stream_player_2d.position = area.position
	#audio_stream_player_2d.play()
	#queue_free()
