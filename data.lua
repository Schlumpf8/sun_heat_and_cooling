local graphics = "__sun_heat_and_cooling__/graphics/"
local sound = "__sun_heat_and_cooling__/sound/"
local icons = "__sun_heat_and_cooling__/graphics/icons/"
local technology = "__sun_heat_and_cooling__/graphics/technology/"
local entity = "__sun_heat_and_cooling__/graphics/entity/"



--require ("sound-util")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

if mods["Moshine"] then
data:extend
{

--    ██   ██ ███████  █████  ████████ 
--    ██   ██ ██      ██   ██    ██    
--    ███████ █████   ███████    ██    
--    ██   ██ ██      ██   ██    ██    
--    ██   ██ ███████ ██   ██    ██    
  {
    type = "lightning",
    name = "sun_heat",
    icon = icons .. "sun_heat.png",
    subgroup = "obstacles",
    flags = {"not-selectable-in-game"},
    factoriopedia_simulation = simulations.factoriopedia_lightning,
    damage = 
    {
      amount = 0.15,
      type = "fire"
    },
    energy = "100MJ",
    time_to_damage = 1,
    effect_duration = 30,
    strike_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            smoke_name = "sun_heat_smoke",
            offsets = {{0, 0}},
            offset_deviation = {{-0.9, -0.7}, {0.9, 0.7}},
            speed = {0, 0},
            initial_height = 0,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.015,
            only_when_visible = true
          }
        }
      }
    },
  },

  {
    type = "trivial-smoke",
    name = "sun_heat_smoke",
    duration = 1200,
    fade_in_duration = 600,
    fade_away_duration = 600,
    glow_fade_away_duration = 600,
    spread_duration = 1200,
    start_scale = 0.62,
    end_scale = 0.75,
    color = util.premul_color{1,1,1, 0.25},
    cyclic = true,
    affected_by_wind = false,
    animation = {
      filename = entity .. "heat-smoke/nothing.png",
      flags = { "smoke" },
      line_length = 8,
      width = 1,
      height = 1,
      frame_count = 60,
      priority = "high",
      animation_speed = 0.15,
    },
    glow_animation = {
      filename = entity .. "heat-smoke/heat-smoke-glow.png",
      flags = { "smoke" },
      blend_mode = "additive",
      line_length = 8,
      width = 253,
      height = 210,
      frame_count = 60,
      --shift = {-0.265625, -0.09375},
      priority = "high",
      animation_speed = 0.15,
    },
    movement_slow_down_factor = 0.1,
  },


--    ██   ██ ███████  █████  ████████          █████  ████████ ████████ ██████   █████   ██████ ████████  ██████  ██████           ██ 
--    ██   ██ ██      ██   ██    ██            ██   ██    ██       ██    ██   ██ ██   ██ ██         ██    ██    ██ ██   ██         ███ 
--    ███████ █████   ███████    ██            ███████    ██       ██    ██████  ███████ ██         ██    ██    ██ ██████           ██ 
--    ██   ██ ██      ██   ██    ██            ██   ██    ██       ██    ██   ██ ██   ██ ██         ██    ██    ██ ██   ██          ██ 
--    ██   ██ ███████ ██   ██    ██    ███████ ██   ██    ██       ██    ██   ██ ██   ██  ██████    ██     ██████  ██   ██ ███████  ██ 




{
    type = "lightning-attractor",
    name = "sun_heat_cooler_1",
    icon = icons .. "sun_heat_cooler_1.png",
    range_elongation = 4.0, -------------------------------------------------------------------------------------RANGE
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "sun_heat_cooler_1"},
    max_health = 40,
    corpse = "sun_heat_cooler_1-remnants",
    dying_explosion =  "selector-combinator-explosion",
    factoriopedia_simulation = simulations.factoriopedia_lightning_rod,
    surface_conditions = {{ property = "pressure", min = 701, max = 701}},
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    lightning_strike_offset = {0, 0},
    damaged_trigger_effect = hit_effects.entity({{-0.2, -0.2},{0.2, 0.2}}),
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    working_sound =
    {

      main_sounds =
      {
        {
          fade_in_ticks = 120,
          fade_out_ticks = 280,
          sound =
          {
            filename = sound .. "sun_heat_cooler_1-charge.ogg",
            volume = 1,
            audible_distance_modifier = 0.5,
          },
        },
      },
      max_sounds_per_prototype = 3,
    },
    chargable_graphics = {
      picture = {
        layers = {
          {
            filename = entity .. "sun_heat_cooler_1/sun_heat_cooler_1.png",
            width = 320,
            height = 320,
            line_length = 1,
            priority = "high",
            scale = 0.5,
          },
          {
            filename = entity .. "sun_heat_cooler_1/sun_heat_cooler_1-shadow.png",
            width = 320,
            height = 320,
            line_length = 1,
            priority = "high",
            draw_as_shadow = true,
            scale = 0.5,
          },
          {
            filename = entity .. "sun_heat_cooler_1/sun_heat_cooler_1-cables.png",
            width = 640,
            height = 640,
            line_length = 1,
            priority = "low",
            draw_as_shadow = true,
            scale = 0.5,
          },
        }
      },
      charge_animation = {
        layers =
        {
          {
            filename = entity .. "sun_heat_cooler_1/sun_heat_cooler_1-charge.png",
            run_mode = "forward",
            width = 320,
            height = 320,
            line_length = 4,
            frame_count = 8,
            priority = "high",
            --blend_mode = "additive",
            scale = 0.15,
            --draw_as_glow = true,
            animation_speed = 1/10,
          }
        }
      },
      charge_animation_is_looped = true,
      charge_cooldown = 10,
    },
    water_reflection =
    {
      pictures =
      {
        filename = entity .. "sun_heat_cooler_1/sun_heat_cooler_1-reflection.png",
        priority = "extra-high",
        width = 36,
        height = 30,
        shift = util.by_pixel(0, 50),
        variation_count = 1,
        scale = 1.5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },

  {
    type = "corpse",
    name = "sun_heat_cooler_1-remnants",
    icon = icons .. "sun_heat_cooler_1.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "environmental-protection-remnants",
    order = "a-k-b",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    expires = false,
    animation = {
      filename = entity .. "sun_heat_cooler_1/sun_heat_cooler_1-remnants.png",
      width = 320,
      height = 320,
      line_length = 1,
      direction_count = 1,
      scale = 0.5
    }
  },









--    ██   ██ ███████  █████  ████████          █████  ████████ ████████ ██████   █████   ██████ ████████  ██████  ██████          ██████  
--    ██   ██ ██      ██   ██    ██            ██   ██    ██       ██    ██   ██ ██   ██ ██         ██    ██    ██ ██   ██              ██ 
--    ███████ █████   ███████    ██            ███████    ██       ██    ██████  ███████ ██         ██    ██    ██ ██████           █████  
--    ██   ██ ██      ██   ██    ██            ██   ██    ██       ██    ██   ██ ██   ██ ██         ██    ██    ██ ██   ██         ██      
--    ██   ██ ███████ ██   ██    ██    ███████ ██   ██    ██       ██    ██   ██ ██   ██  ██████    ██     ██████  ██   ██ ███████ ███████ 

  {
    type = "lightning-attractor",
    name = "sun_heat_cooler_2",
    icon = icons .. "sun_heat_cooler_2.png",
    range_elongation = 47.0, -------------------------------------------------------------------------------------RANGE
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "sun_heat_cooler_2"},
    max_health = 200,
    corpse = "sun_heat_cooler_2-remnants",
    dying_explosion = "chemical-plant-explosion",
    factoriopedia_simulation = simulations.factoriopedia_lightning_rod,
    surface_conditions = {{ property = "pressure", min = 701, max = 701}},
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
    },
    collision_box = {{-1.15, -1.15}, {1.15, 1.15}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    lightning_strike_offset = {0, -1},
    damaged_trigger_effect = hit_effects.entity({{-1.2, -1.2},{1.2, 1.2}}),
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    working_sound =
    {
      main_sounds =
      {
        {
          fade_in_ticks = 120,
          fade_out_ticks = 280,
          sound =
          {
            filename = sound .. "sun_heat_cooler_2-charge.ogg",
            volume = 1,
            audible_distance_modifier = 0.5,
          },
        },
      },
      max_sounds_per_prototype = 3,
    },
    chargable_graphics = {
      picture = {
        layers = {
          {
            filename = entity .. "sun_heat_cooler_2/sun_heat_cooler_2.png",
            width = 320,
            height = 320,
            line_length = 1,
            priority = "high",
            scale = 0.5,
          },
          {
            filename = entity .. "sun_heat_cooler_2/sun_heat_cooler_2-shadow.png",
            width = 320,
            height = 320,
            line_length = 1,
            priority = "high",
            draw_as_shadow = true,
            scale = 0.5,
          },
        }
      },
      charge_animation = {
        layers =
        {
          {
            filename = entity .. "sun_heat_cooler_2/sun_heat_cooler_2-charge.png",
            run_mode = "forward",
            width = 320,
            height = 320,
            line_length = 4,
            frame_count = 8,
            priority = "high",
            --blend_mode = "additive",
            scale = 0.5,
            --draw_as_glow = true,
            animation_speed = 1/10,
          }
        }
      },
      charge_animation_is_looped = true,
      charge_cooldown = 10,
    },
    water_reflection =
    {
      pictures =
      {
        filename = entity .. "sun_heat_cooler_2/sun_heat_cooler_2-reflection.png",
        priority = "extra-high",
        width = 36,
        height = 30,
        shift = util.by_pixel(0, 50),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },

  {
    type = "corpse",
    name = "sun_heat_cooler_2-remnants",
    icon = icons .. "sun_heat_cooler_2.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "environmental-protection-remnants",
    order = "a-k-b",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    expires = false,
    animation = {
      filename = entity .. "sun_heat_cooler_2/sun_heat_cooler_2-remnants.png",
      width = 320,
      height = 320,
      line_length = 1,
      direction_count = 1,
      scale = 0.5
    }
  },
--    ██ ████████ ███████ ███    ███ 
--    ██    ██    ██      ████  ████ 
--    ██    ██    █████   ██ ████ ██ 
--    ██    ██    ██      ██  ██  ██ 
--    ██    ██    ███████ ██      ██ 
  {
    type = "item",
    name = "sun_heat_cooler_1",
    icon = icons .. "sun_heat_cooler_1.png",
    subgroup = "environmental-protection",
    order = "e[sun_heat_cooler_1]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    place_result = "sun_heat_cooler_1",
    stack_size = 50,
    default_import_location = "moshine",
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "sun_heat_cooler_2",
    icon = icons .. "sun_heat_cooler_2.png",
    subgroup = "environmental-protection",
    order = "e[sun_heat_cooler_2]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    place_result = "sun_heat_cooler_2",
    stack_size = 50,
    default_import_location = "moshine",
    random_tint_color = item_tints.iron_rust
  },
--    ██████  ███████  ██████ ██ ██████  ███████ 
--    ██   ██ ██      ██      ██ ██   ██ ██      
--    ██████  █████   ██      ██ ██████  █████   
--    ██   ██ ██      ██      ██ ██      ██      
--    ██   ██ ███████  ██████ ██ ██      ███████ 
  {
    type = "recipe",
    name = "sun_heat_cooler_1",
    categories = {"crafting", "electromagnetics"},
    --surface_conditions = {{ property = "pressure", min = 701, max = 701}},
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "offshore-pump", amount = 1},
      {type = "item", name = "ice", amount = 10},
    },
    results = {{type="item", name="sun_heat_cooler_1", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "sun_heat_cooler_2",
    categories = {"cryogenics"},
    surface_conditions = {{ property = "pressure", min = 701, max = 701}},
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "silicon-carbide", amount = 10},
      {type = "item", name = "electric-engine-unit", amount = 5},
      {type = "item", name = "energy-shield-equipment", amount = 1},
      {type = "fluid", name = "fluoroketone-cold", amount = 10},
    },
    results = {{type="item", name="sun_heat_cooler_2", amount=1}},
    enabled = false,
    sort_item_ingredients = false,
    crafting_machine_tint =
    {
      primary = {r = 0.460, g = 0.188, b = 0.649, a = 1.000}, -- #752fa5ff
      secondary = {r = 0.489, g = 0.484, b = 0.381, a = 1.000}, -- #7c7b61ff
      tertiary = {r = 0.196, g = 0.101, b = 0.101, a = 1.000}, -- #311919ff
      quaternary = {r = 0.518, g = 0.539, b = 0.993, a = 1.000}, -- #8489fdff
    }
  },

--    ████████ ███████  ██████ ██   ██ 
--       ██    ██      ██      ██   ██ 
--       ██    █████   ██      ███████ 
--       ██    ██      ██      ██   ██ 
--       ██    ███████  ██████ ██   ██ 
  {
    type = "technology",
    name = "sun_heat_cooler_1_tech",
    icon = technology .. "sun_heat_cooler_1_tech.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "sun_heat_cooler_1",
      }
    },
    prerequisites = {"planet-discovery-moshine"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "sun_heat_cooler_2_tech",
    icon = technology .. "sun_heat_cooler_2_tech.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "sun_heat_cooler_2",
      }
    },
    prerequisites = {"sun_heat_cooler_1_tech","moshine-tech-silicon-carbide","cryogenic-science-pack"},
    unit =
    {
      count = 460,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"cryogenic-science-pack", 1},
      },
      time = 30
    }
  },

--     █████   ██████ ██   ██ ██ ███████ ██    ██ ███████ ███    ███ ███████ ███    ██ ████████ 
--    ██   ██ ██      ██   ██ ██ ██      ██    ██ ██      ████  ████ ██      ████   ██    ██    
--    ███████ ██      ███████ ██ █████   ██    ██ █████   ██ ████ ██ █████   ██ ██  ██    ██    
--    ██   ██ ██      ██   ██ ██ ██       ██  ██  ██      ██  ██  ██ ██      ██  ██ ██    ██    
--    ██   ██  ██████ ██   ██ ██ ███████   ████   ███████ ██      ██ ███████ ██   ████    ██    
  {
    type = "build-entity-achievement",
    name = "moshine_build_sun_cooler",
    order = "a[progress]-a[automate-this]",
    to_build = "sun_heat_cooler_2",
    icon = technology .. "moshine_build_sun_cooler.png",
    icon_size = 128
  },
}
end