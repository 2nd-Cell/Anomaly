extends Node2D

# res.name: {"qty": int, "row":int, "col":int}
var inventory = {}

func add_to_inventory(res):
	inventory[res.name] = {"res":res, "qty":inventory.get(res.name, {"qty":0})["qty"] + 1}
	print(inventory)

func _on_area_2d_pickup_item(res) -> void:
	add_to_inventory(res)
	print("added item: ", res.name)
