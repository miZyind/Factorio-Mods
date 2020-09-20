local MOD_PATH = "__base__/mods/timer"

data:extend(
  {
    {
      type = "custom-input",
      name = "timer_hotkey",
      key_sequence = "SHIFT + GRAVE",
      consuming = "none",
    },
    {
      type = "font",
      name = "timer_font",
      from = "default-bold",
      border = false,
      size = 15
    },
    {
      type = "sprite",
      name = "timer_sprite_day",
      filename = MOD_PATH.."/graphics/day.png",
      priority = "extra-high",
      width = 32,
      height = 32,
    },
    {
      type = "sprite",
      name = "timer_sprite_daynight",
      filename = MOD_PATH.."/graphics/daynight.png",
      priority = "extra-high",
      width = 32,
      height = 32,
    },
  }
)

local default_gui = data.raw["gui-style"].default

local graphical_set = { base = {position = {104, 48}, size = {40, 24}} }

default_gui.timer_root_style =
{
  type="horizontal_flow_style",
  parent="horizontal_flow",
  vertical_spacing = 0,
  horizontal_spacing = 0,
}

default_gui.timer_time_style=
{
  type="button_style",
  parent="button",
  font="timer_font",
  padding = 0,
  width = 100,
  height = 32,
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
  width = 32,
  height = 32,
  default_graphical_set = graphical_set,
}
