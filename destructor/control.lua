require("util")

local main = {}

local function find_resources(surface, position, range, resource_category)
  local resource_category = resource_category or 'basic-solid'
  local top_left = {x = position.x - range, y = position.y - range}
  local bottom_right = {x = position.x + range, y = position.y + range}
  local resources = surface.find_entities_filtered{area={top_left, bottom_right}, type='resource'}
  local categorized = {}

  for _, resource in pairs(resources) do
    if resource.prototype.resource_category == resource_category then
      table.insert(categorized, resource)
    end
  end

  return categorized
end

local function find_all_entities(entity_type)
  local surface = game.surfaces['nauvis']
  local entities = {}

  for chunk in surface.get_chunks() do
    local chunk_area = {lefttop = {x = chunk.x*32, y = chunk.y*32}, rightbottom = {x = chunk.x*32+32, y = chunk.y*32+32}}
    local chunk_entities = surface.find_entities_filtered({area = chunk_area, type = entity_type})

    for i = 1, #chunk_entities do
      entities[#entities + 1] = chunk_entities[i]
    end
  end

  return entities
end

local function find_target(entity)
  if entity.drop_target then
    return entity.drop_target
  else
    local entities = entity.surface.find_entities_filtered{position=entity.drop_position}

    return entities[1]
  end
end

local function find_targeting(entity)
  local range = global.max_radius
  local position = entity.position
  local top_left = {x = position.x - range, y = position.y - range}
  local bottom_right = {x = position.x + range, y = position.y + range}
  local surface = entity.surface
  local entities = {}
  local targeting = {}
  local entities = surface.find_entities_filtered{area={top_left, bottom_right}, type='mining-drill'}

  for i = 1, #entities do
    if find_target(entities[i]) == entity then
      targeting[#targeting + 1] = entities[i]
    end
  end

  local entities = surface.find_entities_filtered{area={top_left, bottom_right}, type='inserter'}

  for i = 1, #entities do
    if find_target(entities[i]) == entity then
      targeting[#targeting + 1] = entities[i]
    end
  end

  return targeting
end


local function order_deconstruction(drill)
  local target = find_target(drill)

  if target ~= nil and target.minable and target.prototype.selectable_in_game then
    if target.type == "logistic-container" or target.type == "container" then
      local targeting = find_targeting(target)

      if targeting ~= nil then
        for i = 1, #targeting do
          if not targeting[i].to_be_deconstructed(targeting[i].force) then return end
        end

        if target.to_be_deconstructed(target.force) then
          target.cancel_deconstruction(target.force)
        end
      end
    end
  end
end

function check_drill(drill)
  if drill.mining_target ~= nil and drill.mining_target.valid then
    if drill.mining_target.amount > 0 then return end
  end

  local mining_drill_radius = drill.prototype.mining_drill_radius

  if mining_drill_radius > global.max_radius then
    global.max_radius = mining_drill_radius
  end

  if mining_drill_radius == nil then return end

  local resources = find_resources(drill.surface, drill.position, mining_drill_radius, 'basic-solid')

  for i = 1, #resources do
    if resources[i].amount > 0 then return end
  end

  order_deconstruction(drill)
end

local function find_drills(entity)
  local position = entity.position
  local surface = entity.surface
  local top_left = {x = position.x - global.max_radius, y = position.y - global.max_radius}
  local bottom_right = {x = position.x + global.max_radius, y = position.y + global.max_radius}
  local entities = {}
  local targeting = {}
  local entities = surface.find_entities_filtered{area={top_left, bottom_right}, type='mining-drill'}

  for i = 1, #entities do
    local x_distance = math.abs(entities[i].position.x - position.x)
    local y_distance = math.abs(entities[i].position.y - position.y)
    local radius = entities[i].prototype.mining_drill_radius

    if x_distance < radius and y_distance < radius then check_drill(entities[i]) end
  end
end

function main.init(e)
  global.max_radius = 0.99

  for _, drill in pairs(find_all_entities('mining-drill')) do
    check_drill(drill)
  end
end

function main.depleted(e)
  find_drills(e.entity)
end

function main.cancelled(e)
  if e.player_index ~= nil or e.entity.type ~= 'mining-drill' then return end

  check_drill(e.entity)
end

function main.built(e)
  if e.created_entity.type ~= 'mining-drill' then return end
  if e.created_entity.prototype.mining_drill_radius > global.max_radius then
    global.max_radius = e.created_entity.prototype.mining_drill_radius
  end
end

return {
  on_init = main.init,
  on_cancelled_deconstruction = main.cancelled,
  on_resource_depleted = main.depleted,
  on_robot_built_entity = main.built,
  on_built_entity = main.built,
}
