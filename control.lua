-- Mods Global Injection
local Backpacker = require("mods.backpacker.control")
local Destructor = require("mods.destructor.control")
local Quickstart = require("mods.quickstart.control")
local Signal = require("mods.signal.control")
local Timer = require("mods.timer.control")

script.on_init(function ()
  Backpacker.on_init()
  Destructor.on_init()
  Quickstart.on_init()
  Signal.on_init()
  Timer.on_init()
end)

script.on_event(defines.events.on_tick, function (e)
  Signal.on_tick(e)
  Timer.on_tick(e)
end)

script.on_event(defines.events.on_gui_click, function (e)
  Timer.on_gui_click(e)
end)

script.on_event(defines.events.on_player_created, function (e)
  Timer.on_player_created(e)
end)

script.on_event(defines.events.on_player_joined_game, function (e)
  Timer.on_player_joined_game(e)
end)

script.on_event(defines.events.on_player_mined_entity, function (e)
  Signal.on_player_mined_entity(e)
end)

script.on_event(defines.events.on_built_entity, function (e)
  Destructor.on_built_entity(e)
  Signal.on_built_entity(e)
end)

script.on_event(defines.events.on_robot_built_entity, function (e)
  Destructor.on_robot_built_entity(e)
  Signal.on_robot_built_entity(e)
end)

script.on_event(defines.events.on_robot_pre_mined, function (e)
  Signal.on_robot_pre_mined(e)
end)

script.on_event(defines.events.on_entity_cloned, function (e)
  Signal.on_entity_cloned(e)
end)

script.on_event(defines.events.on_entity_died, function (e)
  Signal.on_entity_died(e)
end)

script.on_event(defines.events.on_resource_depleted, function (e)
  Destructor.on_resource_depleted(e)
end)

script.on_event(defines.events.on_cancelled_deconstruction, function (e)
  Destructor.on_cancelled_deconstruction(e)
end)

script.on_event(defines.events.script_raised_built, function (e)
  Signal.script_raised_built(e)
end)

script.on_event(defines.events.script_raised_revive, function (e)
  Signal.script_raised_revive(e)
end)

script.on_event(defines.events.script_raised_destroy, function (e)
  Signal.script_raised_destroy(e)
end)
