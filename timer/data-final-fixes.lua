local MOD_PATH = "__base__/mods/timer"

data:extend(
  {
    {
      type = "custom-input",
      name = "timer_hotkey",
      key_sequence = "GRAVE",
      consuming = "none",
    },
    {
      type = "font",
      name = "timer_font",
      from = "default-bold",
      size = 18
    },
    {
      type = "sprite",
      name = "timer_sprite_day",
      filename = MOD_PATH.."/graphics/day.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
    },
    {
      type = "sprite",
      name = "timer_sprite_daynight",
      filename = MOD_PATH.."/graphics/daynight.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
    },
  }
)

local default_gui = data.raw["gui-style"].default

local graphical_set = { base = {position = {0, 0}, corner_size = 8} }

default_gui.timer_root_style =
{
  type="horizontal_flow_style",
  vertical_spacing = 0,
  horizontal_spacing = 0,
}

default_gui.timer_play_time_style=
{
  type="button_style",
  parent="button",
  font="timer_font",
  padding = 0,
  width = 80,
  height = 40,
  default_font_color = {1, 1, 1},
  hovered_font_color = {1, 1, 1},
  clicked_font_color = {1, 1, 1},
  default_graphical_set = graphical_set,
}

default_gui.timer_game_time_style=
{
  type="button_style",
  parent="button",
  font="timer_font",
  padding = 0,
  width = 120,
  height = 40,
  default_font_color = {1, 1, 1},
  hovered_font_color = {1, 1, 1},
  clicked_font_color = {1, 1, 1},
  default_graphical_set = graphical_set,
}

default_gui.timer_daynight_style =
{
  type="button_style",
  parent="button",
  padding = 0,
  width = 40,
  height = 40,
  default_graphical_set = graphical_set,
}
