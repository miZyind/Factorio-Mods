local MOD_PATH = "__base__/mods/signal"
local COLORS = {
  white  = {r = 1, g = 1, b = 1, a = 0.8},
  blue   = {r = 0, g = 0.7, b = 1, a = 0.8},
  red    = {r = 1, g = 0.3, b = 0, a = 0.8},
  green  = {r = 0, g = 0.8, b = 0, a = 0.8},
  yellow = {r = 1, g = 0.8, b = 0, a = 0.8}
}
local ICONS = {
  none    = MOD_PATH.."/graphics/white-flat.png",
  alert   = MOD_PATH.."/graphics/alert-flat.png",
  cross   = MOD_PATH.."/graphics/cross-flat.png",
  minus   = MOD_PATH.."/graphics/minus-flat.png",
  pause   = MOD_PATH.."/graphics/pause-flat.png",
  stop    = MOD_PATH.."/graphics/stop-flat.png",
  alert3D = MOD_PATH.."/graphics/alert.png",
  cross3D = MOD_PATH.."/graphics/cross.png",
  minus3D = MOD_PATH.."/graphics/minus.png",
  pause3D = MOD_PATH.."/graphics/pause.png",
  stop3D  = MOD_PATH.."/graphics/stop.png"
}
local signal = {
  type = "simple-entity-with-force",
  name = "signal_entity",
  flags = {"not-blueprintable", "not-deconstructable", "not-on-map", "placeable-off-grid"},
  filename = MOD_PATH.."/graphics/white.png",
  icon_size = 64,
  max_health = 100,
  selectable_in_game = false,
  mined_sound = nil,
  minable = nil,
  collision_box = nil,
  selection_box = nil,
  collision_mask = {},
  render_layer = "explosion",
  vehicle_impact_sound = nil,
  pictures = {
    {
      filename = MOD_PATH.."/graphics/off.png",
      priority = "extra-high",
      x = 0,
      y = 0,
      width = 64,
      height = 64,
      scale = 0.25,
    }
  }
}

for _, color_value in pairs(COLORS) do
  for _, icon_value in pairs(ICONS) do
    signal.pictures[#signal.pictures + 1] = {
      filename = icon_value,
      tint = color_value,
      priority = "extra-high",
      x = 0,
      y = 0,
      width = 64,
      height = 64,
      scale = 0.25,
    }

    signal.pictures[#signal.pictures + 1] = {
      filename = icon_value,
      tint = color_value,
      priority = "extra-high",
      x = 0,
      y = 0,
      width = 64,
      height = 64,
      scale = 0.18,
    }
  end
end

data:extend({ signal })
