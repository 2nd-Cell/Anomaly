extends Node2D

class_name InventoryManager

signal on_inventory_update

# res.name: {"qty": int, "row":int, "col":int}
var inventory = {}
var rows = -1
var cols = -1

func add_to_inventory(res):
	if rows == -1 or cols == -1:
		return
	inventory[res.name] = {"res":res, "qty":inventory.get(res.name, {"qty":0})["qty"] + 1}
	on_inventory_update.emit()

func init_inventory(r, c):
	rows = r
	cols = c

func _on_area_2d_pickup_item(res) -> void:
	add_to_inventory(res)

func get_items() -> Dictionary:
	return inventory
