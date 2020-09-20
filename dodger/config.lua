prototype_type_gap_requirements =
{
  ["solar-panel"]              = 0.25,
  ["simple-entity-with-owner"] = 0.25,
  ["simple-entity-with-force"] = 0.25,
  ["accumulator"]              = 0.25,
  ["generator"]                = 0.25,
  ["pipe"]                     = 0.42,
  ["pipe-to-ground"]           = 0.42,
  ["heat-pipe"]                = 0.25,
  ["reactor"]                  = 0.48,
  ["programmable-speaker"]     = 0.25,
  ["container"]                = 0.25,
  ["logistic-container"]       = 0.25,
  ["assembling-machine"]       = 0.25,
  ["arithmetic-combinator"]    = 0.25,
  ["decider-combinator"]       = 0.25,
  ["constant-combinator"]      = 0.25,
  ["boiler"]                   = 0.42,
  ["electric-pole"]            = 0.25,
  ["mining-drill"]             = 0.25,
  ["pump"]                     = 0.42,
  ["radar"]                    = 0.25,
  ["storage-tank"]             = 0.25,
  ["tree"]                     = 0.42,
  ["beacon"]                   = 0.25,
  ["furnace"]                  = 0.25,
  ["lamp"]                     = 0.25,
  ["lab"]                      = 0.25
}

exclusions =
{
  {  -- General Exclusions
    excluded_prototype_names = {}
  },
  {  -- UraniumPower
    apply_when_object_exists = {
      type = "storage-tank",
      name = "lube-port"
    },
    excluded_prototype_names = {
      "lube-port",
      "fluid-box-1",
      "fluid-box-2"
    }
  },
  {  -- RealisticReactors
    apply_when_object_exists = {
      type = "reactor",
      name = "realistic-reactor",
    },
    excluded_prototype_names = {
      "realistic-reactor",
      "realistic-reactor-start",
      "realistic-reactor-2",
      "realistic-reactor-3",
      "realistic-reactor-4",
      "realistic-reactor-interface",
      "realistic-reactor-eccs",
      "heat-pipe",
    }
  },
}
