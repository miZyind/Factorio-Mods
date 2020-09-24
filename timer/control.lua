local main = {}

local SPEED = 64
local TICKS_PER_DAY = 25000
local COLORS = { white = {r = 1, g = 1, b = 1}, yellow = {r = 1, g = 1, b = 0} }

local function init_player(player)
  if global.ticks == nil then return end
  if player.connected then build_gui(player) end
end

local function init_day()
  global.day = 1 + math.floor((game.tick+(TICKS_PER_DAY / 2)) / TICKS_PER_DAY)
end

local function get_time()
  local daytime
  local always_day = global.surface.always_day

  if global.always_day ~= always_day then
    global.refresh_always_day = true
  end

  if always_day then
    daytime = game.tick / TICKS_PER_DAY
    daytime = daytime - math.floor(daytime)
  else
    if global.always_day == true then
      daytime = ((global.h + 12) + (global.m / 60)) / 24
      global.surface.daytime = daytime - math.floor(daytime)
    end
    daytime = global.surface.daytime
  end

  daytime = (daytime*24+12) % 24
  global.day = math.floor((game.tick + ( TICKS_PER_DAY / 2)) / TICKS_PER_DAY) + 1
  global.h = math.floor(daytime)
  global.m = math.floor((daytime - global.h) * 60)
  global.ph = math.floor(game.tick / 216000)
  global.pm = math.floor(game.tick / 3600)
  global.always_day = always_day
end

local function format_play_time()
  return string.format("%d:%02d", global.ph, global.pm % 60)
end

local function format_game_time()
  return string.format("%ud %02u:%02u", global.day, global.h, global.m)
end

local function init_globals()
  global.mod_gui_layout_updated = false
  global.ticks = global.ticks or 0
  global.surface = game.surfaces.nauvis
  global.always_day = global.always_day or -1 -- -1 to force update of the icon at first install
  global.refresh_always_day = true

  if global.offset == nil then global.offset = 0 end
  if global.h == nil then global.h = 12 end
  if global.m == nil then global.m = 0 end
  if global.day == nil then
    init_day()
    get_time()
  end

  if global.display == nil then global.display = true end
end

function build_gui(player)
  if not global.mod_gui_layout_updated and player.gui.top.mod_gui_button_flow then
    player.gui.top.mod_gui_button_flow.style.top_padding = 0
    player.gui.top.mod_gui_button_flow.style.left_padding = 0
    global.mod_gui_layout_updated = true
  end

  local root = player.gui.top.timer_root


  if root == nil and global.display then
    root = player.gui.top.add({
      type = "flow",
      name = "timer_root",
      direction = "horizontal",
      style = "timer_root_style",
    })

    root.add({
      type = "button",
      name = "timer_play_time",
      caption = format_play_time(),
      style = "timer_play_time_style",
      ignored_by_interaction = true,
    })

    root.add({
      type = "button",
      name = "timer_game_time",
      caption = format_game_time(),
      style = "timer_game_time_style",
    })

    local button_daynight = root.add({
      type = "sprite-button",
      name = "timer_daynight",
      style = "timer_daynight_style",
    })

    if global.surface.always_day then
      button_daynight.sprite = "timer_sprite_day"
    else
      button_daynight.sprite = "timer_sprite_daynight"
    end
  end

  return (root)
end

function update_gui()
  if global.display then
    for _, player in pairs(game.players) do
      if player.connected then
        local root = build_gui(player)

        if game.speed == 1 then
          root.timer_game_time.style.font_color = COLORS.white
        else
          root.timer_game_time.style.font_color = COLORS.yellow
        end

        if global.surface.always_day then
          root.timer_daynight.sprite = "timer_sprite_day"
        else
          root.timer_daynight.sprite = "timer_sprite_daynight"
        end
      end
    end
  end
end

function toggle_speed()
  if game.speed == 1 then game.speed = SPEED else game.speed = 1 end
end

function main.init()
  init_globals()

  for _, player in pairs(game.players) do
    init_player(player)
  end
end

function main.init_player(e)
  init_player(game.players[e.player_index])
end

function main.tick()
  if (game.tick % 100) == 0 then
    get_time()

    if global.display then
      local play_time = format_play_time()
      local game_time = format_game_time()
      local root

      for _, player in pairs(game.players) do
        if player.connected and player.gui.top.timer_root then
          root = player.gui.top.timer_root

          if root.timer_play_time == nil then
            root.destroy()
            init_player(player)
            update_gui()
            root = player.gui.top.timer_root
          end

          root.timer_play_time.caption = play_time
          root.timer_game_time.caption = game_time

          if global.refresh_always_day then
            if global.surface.always_day then
              root.timer_daynight.sprite = "timer_sprite_day"
            else
              root.timer_daynight.sprite = "timer_sprite_daynight"
            end
          end
        end
      end

      global.refresh_always_day = false
    end
  end
end

function main.click(e)
  if string.match(e.element.name, "timer_") == nil then return end

  local player = game.players[e.player_index]

  if player.admin then
    if e.element.name == "timer_game_time" then
      toggle_speed()
      update_gui()
    elseif e.element.name == "timer_daynight" then
      global.surface.always_day = not global.surface.always_day
      update_gui()
    end
  else
    player.print("Only admins may change time.")
  end
end

function main.hotkey(e)
  local player = game.players[e.player_index]

  if player.admin then
    toggle_speed()
    update_gui()
  else
    player.print("Only admins may change time.")
  end
end

script.on_event("timer_hotkey", main.hotkey)

return {
  on_init = main.init,
  on_player_created = main.init_player,
  on_player_joined_game = main.init_player,
  on_tick = main.tick,
  on_gui_click = main.click,
}
