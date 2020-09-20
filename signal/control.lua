local main = {}

local SIGNALS_PER_TICK = 40
local STYLE = {}
local LIGHT = { off = 1 }
local COLORS = { "white", "blue", "red", "green", "yellow" }
local SUPPORTED_TYPES = {
  ["assembling-machine"] = true,
  ["lab"]                = true,
  ["furnace"]            = true,
  ["mining-drill"]       = true,
  ["rocket-silo"]        = true,
}
local BLACKLIST_NAMES = {
  ["electric-mining-drill"] = true,
  ["factory-port-marker"]   = true,
}
local ICONS = {
  "none",
  "none small",
  "alert",
  "alert small",
  "cross",
  "cross small",
  "minus",
  "minus small",
  "pause",
  "pause small",
  "stop",
  "stop small",
  "alert3D",
  "alert3D small",
  "cross3D",
  "cross3D small",
  "minus3D",
  "minus3D small",
  "pause3D",
  "pause3D small",
  "stop3D",
  "stop3D small"
}
local ICON_COUNT = table_size(ICONS)
local SETTINGS = {
  ["working"]                          = { color = "green", icon = "none" },
  ["no_power"]                         = { color = "red", icon = "alert" },
  ["no_fuel"]                          = { color = "red", icon = "alert" },
  ["no_input_fluid"]                   = { color = "red", icon = "alert" },
  ["no_research_in_progress"]          = { color = "white", icon = "pause small" },
  ["no_minable_resources"]             = { color = "red", icon = "stop" },
  ["low_input_fluid"]                  = { color = "yellow", icon = "alert" },
  ["low_power"]                        = { color = "yellow", icon = "alert" },
  ["disabled_by_control_behavior"]     = { color = "white", icon = "stop small" },
  ["disabled_by_script"]               = { color = "white", icon = "stop small" },
  ["fluid_ingredient_shortage"]        = { color = "red", icon = "alert" },
  ["fluid_production_overload"]        = { color = "yellow", icon = "pause" },
  ["item_ingredient_shortage"]         = { color = "red", icon = "alert" },
  ["item_production_overload"]         = { color = "yellow", icon = "pause" },
  ["missing_required_fluid"]           = { color = "red", icon = "alert" },
  ["missing_science_packs"]            = { color = "red", icon = "alert" },
  ["waiting_for_source_items"]         = { color = "red", icon = "alert" },
  ["waiting_for_space_in_destination"] = { color = "yellow", icon = "pause" },
}

for color_index, color in pairs(COLORS) do
  for icon_index, icon  in pairs(ICONS) do
    LIGHT[color .. " " .. icon] = ( (color_index - 1) * ICON_COUNT ) + icon_index + 1
  end
end

local function get_signal_position_from(entity)
    local left_top = entity.prototype.selection_box.left_top
    local right_bottom = entity.prototype.selection_box.right_bottom
    local center = (left_top.x + right_bottom.x) / 2
    local width = math.abs(left_top.x) + right_bottom.x
    local x = (width > 1.25 and center - 0.5) or center
    local y = right_bottom.y

    return { x = entity.position.x + x, y = entity.position.y + y - 0.23 }
end

local function new_signal(entity)
    local signal = entity.surface.create_entity{
      name = "signal_entity",
      position = get_signal_position_from(entity),
      force = entity.force
    }

    signal.graphics_variation = STYLE[entity.status] or LIGHT["off"]
    signal.destructible = false

    return signal
end

function main.init()
  global.overlays = {}
  global.update_index = nil

  for status_name, status in pairs(defines.entity_status) do
    local defaults = SETTINGS[status_name]

    if defaults == nil then defaults = { color = "off", icon = "none" } end

    if defaults.color == "off" then
      STYLE[status] = LIGHT["off"]
    else
      STYLE[status] = LIGHT[defaults.color .. " " .. defaults.icon]
    end
  end

  for _, surface in pairs(game.surfaces) do
    for _, signal in pairs(surface.find_entities_filtered{ name = "signal_entity" }) do
      signal.destroy()
    end

    for type in pairs(SUPPORTED_TYPES) do
      for _, entity in pairs(surface.find_entities_filtered{ type = type }) do
        main.add_signal({ created_entity = entity })
      end
    end
  end
end

function main.tick()
  local next = next --very slight perfomance improvment
  local overlays = global.overlays
  local index = global.update_index
  local numiter = 0
  local data

  if index and overlays[index] then
    data = overlays[index]
  else
    index, data = next(overlays, index)
  end

  while index and (numiter < SIGNALS_PER_TICK) do
    local entity = data.entity

    if entity.valid then
      if data.signal.valid then
        data.signal.graphics_variation = STYLE[data.entity.status] or 1
      else
        data.signal = new_signal(entity)
      end
    else
      if data.signal.valid then data.signal.destroy() end

      overlays[index] = nil
    end

    numiter = numiter + 1
    index, data = next(overlays, index)
  end

  global.update_index = index
end


function main.add_signal(e)
  local entity = e.created_entity or e.entity

  if (SUPPORTED_TYPES[entity.type] and not BLACKLIST_NAMES[entity.name]) then
      local data = {}

      if not global.overlays[entity.unit_number] then
          data.entity = entity
          data.signal = new_signal(entity)
          global.overlays[entity.unit_number] = data
      end
  end
end

function main.remove_signal(e)
  local index = e.entity.unit_number
  local overlays = global.overlays
  local data = overlays[index]

  if data then
    local signal = data.signal

    if signal and signal.valid then
        signal.destroy()
    end

    overlays[index] = nil
    global.update_index = nil
  end
end

function main.cloned(e)
  if e.destination.name == "signal_entity" then e.destination.destroy() end
end

return {
  on_init = main.init,
  on_tick = main.tick,
  on_player_mined_entity = main.remove_signal,
  on_built_entity = main.add_signal,
  on_robot_built_entity = main.add_signal,
  on_robot_pre_mined = main.remove_signal,
  on_entity_cloned = main.cloned,
  on_entity_died = main.remove_signal,
  script_raised_built = main.add_signal,
  script_raised_revive = main.add_signal,
  script_raised_destroy = main.remove_signal,
}
