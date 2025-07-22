extends GridContainer

@export var slot_scene: PackedScene
var slots: Array = []

@export var InventoryManager: Node2D

@export var rows = 2
@export var col = 3

func _ready():
	# Create 6 slots in a grid
	columns = col
	for i in range(rows*col):
		var slot = slot_scene.instantiate()
		slots.append(slot)
		add_child(slot)
		InventoryManager.init_inventory(rows, col)
	#InventoryManager.connect("on_inventory_update", update_display)

func update_display():
	# Clear all slots first
	for slot in slots:
		slot.display_item(null, 0)
		
	var items = InventoryManager.get_items()
	print(items)
	var ind = 0
	for i in items:
		slots[ind].display_item(items[i].res, items[i].qty)
		ind += 1


func _on_inventory_backend_on_inventory_update() -> void:
	update_display()
