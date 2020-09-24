local MOD_PATH = "__base__/mods/gunfire"
local BEAMS = {
  "bullet-beam-basic",
  "bullet-beam-blue",
  "bullet-beam-blue-faint",
  "bullet-beam-cyan",
  "bullet-beam-cyan-faint",
  "bullet-beam-green",
  "bullet-beam-green-faint",
  "bullet-beam-magenta",
  "bullet-beam-magenta-faint",
  "bullet-beam-olive",
  "bullet-beam-olive-faint",
  "bullet-beam-orange",
  "bullet-beam-orange-faint",
  "bullet-beam-piercing",
  "bullet-beam-purple",
  "bullet-beam-purple-faint",
  "bullet-beam-red",
  "bullet-beam-red-faint",
  "bullet-beam-teal",
  "bullet-beam-teal-faint",
  "bullet-beam-white",
  "bullet-beam-white-faint",
  "bullet-beam-yellow",
  "bullet-beam-yellow-faint",
}
local combined = {}

for _, beam in pairs(BEAMS) do
  combined[#combined + 1] = {
    type = "explosion",
    name = beam,
    flags = {"not-on-map", "placeable-off-grid"},
    random_target_offset = true,
    target_offset_y = -0.3,
    animation_speed = 1,
    rotate = true,
    beam = true,
    animations =
    {
      {
        filename = MOD_PATH.."/graphics/entity/projectile/"..beam..".png",
        priority = "extra-high",
        width = 7,
        height = 90,
        frame_count = 5,
      }
    },
    light = {intensity = 0.1, size = 2},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  }
end

data:extend(combined)

local function add_trail_to_ammo(ammo_name, trail_name)
  local ammo = data.raw.ammo[ammo_name]

  if not (ammo and ammo.ammo_type) then return end

  local action = ammo.ammo_type.action[1] or ammo.ammo_type.action

  if not action then return end

  local action_delivery = action.action_delivery[1] or action.action_delivery

  if not action_delivery then return end

  if not action_delivery.target_effects then action_delivery.target_effects = {} end

  if (not action_delivery.target_effects[1]) and action_delivery.target_effects.type then
    action_delivery.target_effects = {action_delivery.target_effects}
  end

  local target_effects = action_delivery.target_effects

  if target_effects[#target_effects].entity_name and string.find(target_effects[#target_effects].entity_name, "bullet-beam-", 1, true) then
    target_effects[#target_effects].entity_name = trail_name
  else
    table.insert(action_delivery.target_effects, { type = "create-explosion", entity_name = trail_name })
  end
end

for ammo_name, ammo in pairs(data.raw.ammo) do
  if ammo.ammo_type and ammo.ammo_type.category and ammo.ammo_type.category == "bullet" then
    add_trail_to_ammo(ammo_name, "bullet-beam-white-faint")
  end
end

add_trail_to_ammo('firearm-magazine', "bullet-beam-yellow-faint")

add_trail_to_ammo('piercing-rounds-magazine', "bullet-beam-red-faint")

add_trail_to_ammo('uranium-rounds-magazine', "bullet-beam-olive")
