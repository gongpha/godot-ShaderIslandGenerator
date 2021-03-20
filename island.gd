extends Node

const WIDTH := 1024
const HEIGHT := 1024
const SCALE := 1

onready var island := $island as TextureRect

var noise : OpenSimplexNoise = OpenSimplexNoise.new()

func generate() :
	randomize()
	noise.seed = randi()
	noise.octaves = 9
	noise.period = 192
	noise.persistence = 0.6
	var imgt := ImageTexture.new()
	imgt.create_from_image(noise.get_image(island.get_rect().size.x * SCALE, island.get_rect().size.y * SCALE))
	var mat := island.get_material()
	mat.set_shader_param("island_tex", imgt)
	
func _ready() :
	generate()

func _on_Button_pressed() :
	generate()
