extends ColorRect

@onready var item_icon = $item_icon
@onready var item_quantity = $item_qty

func display_item(item, qty):
	if item:
		item_icon.texture = item.inv_sprite
		item_icon.visible = true
		if qty > 1:
			item_quantity.text = str(qty)
			item_quantity.visible = true
		else:
			item_quantity.visible = false
	else:
		item_icon.visible = false
		item_quantity.visible = false
