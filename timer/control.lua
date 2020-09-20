local main = {}
local ticks_per_day = 25000
local colors = {
  white = {r = 1, g = 1, b = 1},
  yello = {r = 1, g = 1, b = 0},
}

local function init_player(player)
  if global.ticks == nil then return end
  if player.connected then build_gui(player) end
end

local function init_day()
  global.day = 1 + math.floor((game.tick+(ticks_per_day/2)) / ticks_per_day)
end

local function get_time()
  -- daytime : 0.0 to 1.0, noon to noon (midnight at 0.5), max light to min light to max light...
  -- game starts at daytime = 0, so noon of day 1.

  local daytime
  local always_day = global.surface.always_day

  if global.always_day ~= always_day then
    global.refresh_always_day = true
  end

  if always_day then
    daytime = game.tick / ticks_per_day
    daytime = daytime - math.floor(daytime)
  else
    if global.always_day == true then
      daytime = ((global.h + 12) + (global.m / 60)) / 24
      global.surface.daytime = daytime - math.floor(daytime)
    end
    daytime = global.surface.daytime
  end

  daytime = (daytime*24+12) % 24
  global.h = math.floor(daytime)
  global.m = math.floor((daytime-global.h)*60)
  global.day = math.floor((game.tick+(ticks_per_day/2)) / ticks_per_day) + 1
  global.always_day = always_day
  global.h_prev = global.h
end

local function format_time()
  return string.format("%ud %02u:%02u", global.day, global.h, global.m)
end

local function init_globals()
  global.ticks = global.ticks or 0
  global.cycles = global.cycles or 0
  global.surface = game.surfaces.nauvis
  global.h_prev = global.h_prev or 23
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
  local root = player.gui.screen.timer_root

  if root == nil and global.display then
    root = player.gui.screen.add({
      type = "flow",
      name = "timer_root",
      direction = "horizontal",
      style = "timer_root_style"
    })

    local button_time = root.add({
      type = "button",
      name = "timer_time",
      caption = format_time(),
      style = "timer_time_style"
    })

    local button_daynight = root.add({
      type = "sprite-button",
      name = "timer_daynight",
      style = "timer_daynight_style"
    })

    if global.surface.always_day then
      button_daynight.sprite = "sprite_timer_day"
    else
      button_daynight.sprite = "sprite_timer_daynight"
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
          root.timer_time.style.font_color = colors.white
        else
          root.timer_time.style.font_color = colors.yello
        end

        if global.surface.always_day then
          root.timer_daynight.sprite = "sprite_timer_day"
        else
          root.timer_daynight.sprite = "sprite_timer_daynight"
        end
      end
    end
  end
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
      local time = format_time()
      local root

      for _, player in pairs(game.players) do
        if player.connected and player.gui.screen.timer_root then
          root = player.gui.screen.timer_root

          if root.timer_time == nil then
            root.destroy()
            init_player(player)
            update_gui()
            root = player.gui.screen.timer_root
          end

          root.timer_time.caption = time

          if global.refresh_always_day then
            if global.surface.always_day then
              root.timer_daynight.sprite = "sprite_timer_day"
            else
              root.timer_daynight.sprite = "sprite_timer_daynight"
            end
          end
        end
      end

      global.refresh_always_day = false
    end
  end
end

function main.click(e)
  local player = game.players[e.player_index]

  if string.match(e.element.name, "timer_") == nil then return end

  if player.admin then
    if e.element.name == "timer_time" then
      if game.speed == 1 then game.speed = 64 else game.speed = 1 end
      update_gui()
    elseif e.element.name == "timer_daynight" then
      global.surface.always_day = not global.surface.always_day
      update_gui()
    end
  else
    player.print("Only admins may change time.")
  end
end

return {
  on_init = main.init,
  on_player_created = main.init_player,
  on_player_joined_game = main.init_player,
  on_tick = main.tick,
  on_gui_click = main.click,
}
