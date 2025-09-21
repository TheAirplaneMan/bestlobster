minetest.register_craftitem("bestlobster:lobster", {
	description = ("Raw Lobster"),
	inventory_image = "bestlobster_lobster.png",
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
	inventory_image = "bestlobster_lobsterboiled.png",
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




minetest.register_craftitem("bestlobster:seafood_boil", {
	description = ("Seafood Boil"),
	inventory_image = "bestlobster_seafood_boil.png",
	on_use = minetest.item_eat(18),
	groups = {food_seafood_boil = 1, flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "bestlobster:seafood_boil",
	recipe = {"bestlobster:potato_boiled", "bestlobster:potato_boiled", "bestlobster:carrot_boiled", "bestlobster:carrot_boiled", "bestlobster:lobster"},
})



-- Lobster Trap

minetest.register_node("bestlobster:lobstertrap", {
	description = ("Lobster-Trap"),
	tiles = {"bestlobster_lobster_trap_top.png", "bestlobster_lobster_trap_top.png", "bestlobster_lobster_trap.png"},
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_abm({
    label = "Lobster Trapping",
    nodenames = {"bestlobster:lobstertrap"},
    neighbors = {"group:water"},
    interval = 400,
    chance = 1,
    action = function(pos, node, active_object_count, active_object_count_wider)
        if math.random(450, 800) <= 70 then
            return
        end
        
        minetest.set_node(pos, {name="bestlobster:lobstertrap_full"})
    end
})

minetest.register_node("bestlobster:lobstertrap_full", {
	description = ("Lobster-Trap with Lobster"),
	tiles = {"bestlobster_lobster_trap_top.png", "bestlobster_lobster_trap_top.png", "bestlobster_lobster_trap_with_lobster.png"},
	is_ground_content = false,
	drop = "bestlobster:lobster",
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, dig_immediate = 3},
	sounds = default.node_sound_wood_defaults(),
	node_dig_prediction = "bestlobster:lobstertrap",

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		minetest.set_node(pos, {name = "bestlobster:lobstertrap"})
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,
})

minetest.register_craft({
	output = "bestlobster:lobstertrap",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"xpanes:bar_flat", "farming:bread", "xpanes:bar_flat"},
		{"group:wood", "group:wood", "group:wood"},
	}
})




-- Multitool

minetest.register_tool("bestlobster:lobster_tool", {
	range = 7,
	description = ("Lobster Claw Multi-Tool"),
	inventory_image = "bestlobster_lobster_tool.png",
	wield_scale= {x = 2, y = 2, z = 1.5},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.00, [2]=2.00, [3]=1.30}, uses=20, maxlevel=1},
			cracky = {times={[1]=5.10, [2]=2.40, [3]=1.20}, uses=20, maxlevel=2},
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1, axe = 1, shovel = 1}
})

minetest.register_craft({
	output = "bestlobster:lobster_tool",
	recipe = {
		{"bestlobster:lobster", "default:mese_crystal", "bestlobster:lobster"},
		{"", "default:obsidian_shard", ""},
		{"", "default:obsidian_shard", ""},
	}
})