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
	# 각 버튼의 pressed 시그널을 함수에 연결
	add_btn.pressed.connect(_on_add_pressed)
	sub_btn.pressed.connect(_on_sub_pressed)
	mul_btn.pressed.connect(_on_mul_pressed)
	div_btn.pressed.connect(_on_div_pressed)
	clear_btn.pressed.connect(_on_clear_pressed)

	result_label.text = "0"

# 입력값 검증 및 반환 함수
func _get_values() -> Array:
	var a_text := a_input.text.strip_edges()
	var b_text := b_input.text.strip_edges()

	if a_text == "" or b_text == "":
		result_label.text = "숫자를 입력하세요"
		return [null, null, false]

	if not a_text.is_valid_float() or not b_text.is_valid_float():
		result_label.text = "숫자를 입력하세요"
		return [null, null, false]

	var a: float = a_text.to_float()
	var b: float = b_text.to_float()
	return [a, b, true]

# 덧셈
func _on_add_pressed() -> void:
	var v = _get_values()
	if not v[2]:
		return
	result_label.text = str(v[0] + v[1])

# 뺄셈
func _on_sub_pressed() -> void:
	var v = _get_values()
	if not v[2]:
		return
	result_label.text = str(v[0] - v[1])

# 곱셈
func _on_mul_pressed() -> void:
	var v = _get_values()
	if not v[2]:
		return
	result_label.text = str(v[0] * v[1])

# 나눗셈
func _on_div_pressed() -> void:
	var v = _get_values()
	if not v[2]:
		return
	if v[1] == 0.0:
		result_label.text = "0으로 나눌 수 없음"
		return
	result_label.text = str(v[0] / v[1])

# 초기화
func _on_clear_pressed() -> void:
	a_input.text = ""
	b_input.text = ""
	result_label.text = "0"
