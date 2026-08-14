local moshine_smoke_entities = {}

script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}, function(event)
    local entity = event.entity

    if entity.valid and entity.name == "sun_heat_cooler_2" then
        local smoke = entity.surface.create_entity({
            name = "sun-heat-cooler-particle-source",
            position = {
                entity.position.x,
                entity.position.y
            }
        })
        if smoke then
            moshine_smoke_entities[entity.unit_number] = smoke
        end
    end
end)

script.on_event({defines.events.on_entity_died, defines.events.on_pre_player_mined_item, defines.events.script_raised_destroy, defines.events.on_robot_pre_mined}, function(event)
    local entity = event.entity

    if entity.valid and entity.name == "sun_heat_cooler_2" then
        if not entity.unit_number then return end
        local smoke = moshine_smoke_entities[entity.unit_number]
        if smoke and smoke.valid then
            smoke.destroy()
        end

        moshine_smoke_entities[entity.unit_number] = nil
    end
end)
