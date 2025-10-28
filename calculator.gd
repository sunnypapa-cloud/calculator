extends Control

@onready var a_input: LineEdit = $MarginContainer/VBoxContainer/HBoxContainer/AInput
@onready var b_input: LineEdit = $MarginContainer/VBoxContainer/HBoxContainer/BInput
@onready var add_btn: Button = $MarginContainer/VBoxContainer/HBoxContainer2/AddBtn
@onready var sub_btn: Button = $MarginContainer/VBoxContainer/HBoxContainer2/SubBtn
@onready var mul_btn: Button = $MarginContainer/VBoxContainer/HBoxContainer2/MulBtn
@onready var div_btn: Button = $MarginContainer/VBoxContainer/HBoxContainer2/DivBtn
@onready var clear_btn: Button = $MarginContainer/VBoxContainer/HBoxContainer2/ClearBtn
@onready var result_label: Label = $MarginContainer/VBoxContainer/ResultLabel

func _ready() -> void:
	add_btn.pressed.connect(_on_add_pressed)
	sub_btn.pressed.connect(_on_sub_pressed)
	mul_btn.pressed.connect(_on_mul_pressed)
	div_btn.pressed.connect(_on_div_pressed)
	clear_btn.pressed.connect(_on_clear_pressed)

func _get_values() -> Array:
	var a_text := a_input.text.strip_edges()
	var b_text := b_input.text.strip_edges()
	if a_text == "" or b_text == "":
		result_label.text = "숫자를 입력하세요"
		return [null, null, false]
	var a: float
	var b: float
	try:
		a = float(a_text)
		b = float(b_text)
	except:
		result_label.text = "숫자를 입력하세요"
		return [null, null, false]
	return [a, b, true]

func _on_add_pressed() -> void:
	var v = _get_values()
	if not v[2]: return
	result_label.text = str(v[0] + v[1])

func _on_sub_pressed() -> void:
	var v = _get_values()
	if not v[2]: return
	result_label.text = str(v[0] - v[1])

func _on_mul_pressed() -> void:
	var v = _get_values()
	if not v[2]: return
	result_label.text = str(v[0] * v[1])

func _on_div_pressed() -> void:
	var v = _get_values()
	if not v[2]: return
	if v[1] == 0.0:
		result_label.text = "0으로 나눌 수 없음"
		return
	result_label.text = str(v[0] / v[1])

func _on_clear_pressed() -> void:
	a_input.text = ""
	b_input.text = ""
	result_label.text = "0"
