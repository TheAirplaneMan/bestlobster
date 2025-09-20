minetest.register_craftitem("bestlobster:lobster", {
	description = ("Raw Lobster"),
	inventory_image = "best_lobster_lobster.png",
	groups = {food_lobster = 1},
	on_use = minetest.item_eat(-2), -- It is not healthy to eat raw Lobsters
})

minetest.register_craft({
	type = "cooking",
	cooktime = 25,
	output = "bestlobster:lobster_boiled",
	recipe = "bestlobster:lobster"
})

minetest.register_craftitem("bestlobster:lobster_boiled", {
	description = ("Boiled Lobster"),
	inventory_image = "best_lobster_lobster_boiled.png",
	groups = {food_lobster = 1},
	on_use = minetest.item_eat(5),
})


farming.register_plant("bestlobster:potato", {
	description = ("Potato Seed"),
	harvest_description = ("Potato"),
	paramtype2 = "meshoptions",
	inventory_image = "bestlobster_potato_seed.png",
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_potato = 1, flammable = 4},
	place_param2 = 3,
})

farming.register_plant("bestlobster:carrot", {
	description = ("Carrot Seed"),
	harvest_description = ("Carrot"),
	paramtype2 = "meshoptions",
	inventory_image = "bestlobster_carrot_seed.png",
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_carrot = 1, flammable = 4},
	place_param2 = 3,
})


-- Cooked Food

minetest.register_craftitem("bestlobster:potato_boiled", {
	description = ("Boiled Potato"),
	inventory_image = "bestlobster_potato_boiled.png",
	on_use = minetest.item_eat(3),
	groups = {food_potato = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "bestlobster:potato_boiled",
	recipe = "bestlobster:potato"
})

minetest.register_craftitem("bestlobster:carrot_boiled", {
	description = ("Boiled Carrot"),
	inventory_image = "bestlobster_carrot_boiled.png",
	on_use = minetest.item_eat(3),
	groups = {food_potato = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "bestlobster:carrot_boiled",
	recipe = "bestlobster:carrot"
})