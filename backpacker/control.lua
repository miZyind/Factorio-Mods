local main = {}

function main.init(e)
  local crafting_speed_modifier = 10 -- 10x speed
  local distance_bonus = 125
  local inventory_slots_bonus = 60

  game.forces["player"].manual_crafting_speed_modifier = crafting_speed_modifier
  game.forces["player"].character_build_distance_bonus = distance_bonus
  game.forces["player"].character_reach_distance_bonus = distance_bonus
  game.forces["player"].character_inventory_slots_bonus = inventory_slots_bonus
end

return {
  on_init = main.init,
}
