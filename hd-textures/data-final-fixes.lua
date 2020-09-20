local MOD_PATH = "__base__/mods/hd-textures"
local ENTITY_PATH = "__base__/graphics/entity"
local BANNED_TYPES =
{
  ["technology"]        = true,
  ["item"]              = true,
  ["recipe"]            = true,
  ["item-subgroup"]     = true,
  ["tree"]              = true,
  ["ammo"]              = true,
  ["armor"]             = true,
  ["gun"]               = true,
  ["virtual-signal"]    = true,
  ["autoplace-control"] = true,
  ["ammo-category"]     = true,
  ["recipe-category"]   = true,
  ["ambient-sound"]     = true,
  ["projectile"]        = true,
}

local TEXTURES =
{
  ["assembling-machine-1"]              = true,
  ["assembling-machine-2"]              = true,
  ["assembling-machine-3"]              = true,
  ["beacon"]                            = true,
  ["inserter"]                          = true,
  ["electric-mining-drill"]             = true,
  ["splitter"]                          = true,
  ["transport-belt"]                    = true,
  ["transport-belt-to-ground"]          = true,
  ["accumulator"]                       = true,
  ["beam"]                              = true,
  ["blood-particle"]                    = false,
  ["blue-laser"]                        = false,
  ["branch-particle"]                   = false,
  ["big-electric-pole"]                 = true,
  ["boiler"]                            = false,
  ["burner-inserter"]                   = true,
  ["burner-mining-drill"]               = true,
  ["car"]                               = true,
  ["cargo-wagon"]                       = false,
  ["chemical-plant"]                    = true,
  ["coal"]                              = true,
  ["coal-particle"]                     = false,
  ["copper-ore-particle"]               = false,
  ["crude-oil"]                         = true,
  ["defender"]                          = true,
  ["destroyer"]                         = true,
  ["distractor"]                        = true,
  ["construction-robot"]                = true,
  ["copper-ore"]                        = true,
  ["curved-rail"]                       = true,
  ["decorative"]                        = true,
  ["diesel-locomotive"]                 = false,
  ["electric-furnace"]                  = true,
  ["express-splitter"]                  = true,
  ["express-transport-belt"]            = true,
  ["express-transport-belt-to-ground"]  = true,
  ["explosion"]                         = true,
  ["explosion-gunshot"]                 = true,
  ["explosion-hit"]                     = true,
  ["explosive-rocket"]                  = true,
  ["fast-inserter"]                     = true,
  ["filter-inserter"]                   = true,
  ["stack-inserter"]                    = true,
  ["stack-filter-inserter"]             = true,
  ["fast-splitter"]                     = true,
  ["fast-transport-belt"]               = true,
  ["fast-transport-belt-to-ground"]     = true,
  ["filter-inserter"]                   = true,
  ["gate"]                              = true,
  ["gun-turret"]                        = true,
  ["iron-chest"]                        = true,
  ["iron-ore"]                          = true,
  ["lab"]                               = true,
  ["land-mine"]                         = true,
  ["laser-turret"]                      = true,
  ["logistic-chest-passive-provider"]   = true,
  ["logistic-chest-active-provider"]    = true,
  ["logistic-chest-storage"]            = true,
  ["logistic-chest-requester"]          = true,
  ["logistic-robot"]                    = true,
  ["long-handed-inserter"]              = true,
  ["market"]                            = true,
  ["medium-electric-pole"]              = true,
  ["medium-explosion"]                  = true,
  ["offshore-pump"]                     = true,
  ["oil-refinery"]                      = true,
  ["pipe"]                              = true,
  ["pipe-covers"]                       = true,
  ["pipe-to-ground"]                    = true,
  ["power-switch"]                      = true,
  ["pumpjack"]                          = true,
  ["radar"]                             = true,
  ["rail-chain-signal"]                 = true,
  ["remnants"]                          = true,
  ["player"]                            = true,
  ["rail-signal"]                       = true,
  ["roboport"]                          = true,
  ["rocket-silo"]                       = true,
  ["rocket-silo-rocket"]                = true,
  ["small-electric-pole"]               = true,
  ["small-lamp"]                        = true,
  ["small-pump"]                        = true,
  ["scorchmark"]                        = true,
  ["slowdown-sticker"]                  = true,
  ["ship-wreck"]                        = true,
  ["smart-chest"]                       = true,
  ["smart-inserter"]                    = true,
  ["solar-panel"]                       = true,
  ["sparks"]                            = true,
  ["smoke"]                             = true,
  ["smoke-construction"]                = true,
  ["smoke-fast"]                        = true,
  ["stack-filter-inserter"]             = true,
  ["stack-inserter"]                    = true,
  ["steam-engine"]                      = true,
  ["steel-chest"]                       = true,
  ["steel-furnace"]                     = true,
  ["stone"]                             = true,
  ["stone-particle"]                    = true,
  ["stone-furnace"]                     = true,
  ["stone-wall"]                        = true,
  ["storage-tank"]                      = true,
  ["straight-rail"]                     = true,
  ["substation"]                        = true,
  ["tank"]                              = true,
  ["train-stop"]                        = true,
  ["tree"]                              = true,
  ["water-splash"]                      = true,
  ["wooden-chest"]                      = true,
  ["fire-flame"]                        = true,
  ["fire-flame-on-tree"]                = true,
  ["fire-smoke-without-glow"]           = true,
  ["fire-smoke-without-glow"]           = true,
  ["soft-fire-smoke"]                   = true,
  ["fire-smoke-on-adding-fuel"]         = true,
  ["fire-sticker"]                      = true,
  ["handheld-flamethrower-fire-stream"] = true,
  ["fire-flame"]                        = true,
  ["fire-flame"]                        = true,
  ["fire-flame"]                        = true,
  ["sticker"]                           = true,
  ["fire-flame"]                        = true,
  ["fire-smoke"]                        = true,
  ["stream"]                            = true,
  ["flame-thrower-explosion"]           = true,
  ["flamethrower-fire-stream"]          = true,
  ["fluid-turret"]                      = true,
  ["small-biter"]                       = true,
  ["medium-biter"]                      = true,
  ["big-biter"]                         = true,
  ["behemoth-biter"]                    = true,
  ["small-biter-corpse"]                = true,
  ["medium-biter-corpse"]               = true,
  ["big-biter-corpse"]                  = true,
  ["behemoth-biter-corpse"]             = true,
  ["small-spitter"]                     = true,
  ["medium-spitter"]                    = true,
  ["big-spitter"]                       = true,
  ["behemoth-spitter"]                  = true,
  ["small-spitter-corpse"]              = true,
  ["medium-spitter-corpse"]             = true,
  ["big-spitter-corpse"]                = true,
  ["behemoth-spitter-corpse"]           = true,
  ["small-worm-turret"]                 = true,
  ["medium-worm-turret"]                = true,
  ["big-worm-turret"]                   = true,
  ["small-worm-corpse"]                 = true,
  ["medium-worm-corpse"]                = true,
  ["big-worm-corpse"]                   = true,
  ["biter-spawner"]                     = true,
  ["spitter-spawner"]                   = true,
  ["biter-spawner-corpse"]              = true,
  ["spitter-spawner-corpse"]            = true,
}

local function allow_change(name)
  if TEXTURES[name] == nil then
    return true
  end

  return TEXTURES[name]
end

local function change_file_name(t, filename)
  if filename == nil then
    t.filename = string.gsub(t.filename, "__base__", MOD_PATH)
  else
    t.filename = filename
  end
end

local function override_sprite(t, modifier, filename)
  change_file_name(t, filename)
  scale_sprite(t, modifier)
end

local function override_all_sprites(t, modifier)
  for k,v in pairs(t) do
    change_file_name(v)
    scale_sprite(v, modifier)
  end
end

local function manual_override_sprite(t, width, height, modifier, filename)
  change_file_name(t, filename)
  scale_sprite(t, modifier)
  t.width = width
  t.height = height
end

local function change_animation(t, width_in_frames, height_in_frames)
  change_file_name(t)
  change_animation_size(t, width_in_frames, height_in_frames)
end

local function change_animation_size(t, width_in_frames, height_in_frames)
  if height_in_frames == nil then
    t.line_length = width_in_frames
  else
    t.width_in_frames = width_in_frames
    t.height_in_frames = height_in_frames
  end
end

function scale_sprite(t, modifier)
  modifier = modifier or 2
  if t.width ~= nil then
    t.width = math.floor(t.width * modifier)
  end
  if t.height ~= nil then
    t.height = math.floor(t.height * modifier)
  end
  t.scale = (t.scale or 1) / modifier

  if t.y ~= nil then
    t.y = t.y * modifier
  end
  if t.x ~= nil then
    t.x = t.x * modifier
  end
end

local function override_animation(t, width_in_frames, height_in_frames)
  change_animation_size(t, width_in_frames, height_in_frames)
  override_sprite(t)
end

local function add_stripes(t, width, height, filenames, yValue)
  scale_sprite(t)
  t.filename = nil
  t.x = nil
  t.y = nil
  t.line_length = nil
  t.stripes = {}
  if yValue then
    yValue = yValue * 2
  end
  for i = 1, #filenames do
    if width ~= nil then
      t.stripes[i] =
      {
        filename = filenames[i],
        width_in_frames = width,
        height_in_frames = height,
        y = yValue
      }
    else
      t.stripes[i] =
      {
        filename = filenames[i][1],
        width_in_frames = filenames[i][2],
        height_in_frames = filenames[i][3],
        y = yValue
      }
    end
  end
end

local function merge_tables(t)
  local merged = {}
  for i = 1, #t do
    for x = 1, #t[i] do
      merged[#merged + 1] = t[i][x]
    end
  end
  return merged
end

local function strip_merge(t, length, stripLengths)
  local combined = {}
  for i = 0,length - 1 do
    for z = 1,#t do
      for x = 1,stripLengths[z] do
        combined[#combined + 1] = t[z][i * stripLengths[z] + x]
      end
    end
  end
  return combined
end

local function create_file_paths(prefix, postfix, count, start, width, height)
  paths = {}
  start = start or 1
  for i = start, start - 1 + count do
    if width == nil then
      paths[i - start + 1] = prefix..tostring(i)..postfix
    else
      paths[i - start + 1] = { prefix..tostring(i)..postfix, width, height}
    end
  end
  return paths
end

local function texture_to_sprites_converter(t, pathTemplate)
  if t.filenames ~= nil and t.line_length ~= nil and t.lines_per_file ~= nil and t.direction_count ~= nil then
    local paths = {}
    local spritesLeft = t.direction_count
    for i = 1, #t.filenames do
      local filesPath = string.gsub(pathTemplate, "&", tostring(i))
      local spritesInFile = math.min(t.line_length * t.lines_per_file, spritesLeft)
      paths[#paths + 1] = create_file_paths(filesPath, ".png", spritesInFile)
      spritesLeft  = spritesLeft - spritesInFile
    end
    local allPaths = {}
    local index = 1
    for i = 1, #paths do
      for x = 1, #paths[i] do
        allPaths[index] = paths[i][x]
        index = index + 1
      end
    end

    scale_sprite(t)

    t.filenames = allPaths
    t.line_length = 1
        t.lines_per_file = 1
  elseif t.stripes ~= nil and t.frame_count ~= nil and t.direction_count ~= nil then
    if pattern_match_column_additions(t) then
      local numberOfStripMerges = get_stripe_merges(t)
      local stripeSpritePaths = get_stripe_sprite_paths(t, pathTemplate)
      local stripMergedTogether = get_merged_strips(t, numberOfStripMerges, stripeSpritePaths)
      local orderedStripePaths = merge_tables(stripMergedTogether)
      add_stripes(t, 1, 1, orderedStripePaths)
    else
      local paths = {}
      local index = 1
      local spriteCount = 0
      local width = 0
      for i = 1, #t.stripes do
        spriteCount = spriteCount + t.stripes[i].height_in_frames * t.stripes[i].width_in_frames
        width = width + t.stripes[i].width_in_frames
      end
      for row = 1, t.stripes[1].height_in_frames do
        for stripeNumber = 1, #t.stripes do
          for col = 1, t.stripes[1].width_in_frames do
            if index <= spriteCount then
              local stripesPath = string.gsub(pathTemplate, "&", tostring(stripeNumber))
              paths[#paths + 1] = create_file_paths(stripesPath, ".png", 1, (row - 1) * width + col)[1]
              index = index + 1
            end
          end
        end
      end
      for k, v in ipairs(paths) do
        print(v)
      end
      add_stripes(t, 1, 1, paths)
    end
  elseif t.filename ~= nil and t.frame_count ~= nil then
    local width = (t.line_length or t.frame_count)
    local height = (t.direction_count or 1) * (t.frame_count / (t.line_length or t.frame_count))
    local startSpriteNumber = width * (((t.y or 0) / t.height)) + 1
    local numberOfSprites = t.frame_count * (t.direction_count or 1)

    add_stripes(t, 1, 1, create_file_paths(pathTemplate, ".png", numberOfSprites, startSpriteNumber))
  else
    print("couldn't convert stripe texture to sprites")
  end
end

local function pattern_match_column_additions(t)
  local frameHeight = t.stripes[1].height_in_frames
  for i = 2, #t.stripes do
    if frameHeight ~= t.stripes[i].height_in_frames then
      return false
    end
  end
  return true
end

local function get_stripe_merges(t)
  local sum = 0
  for i = 1, #t.stripes do
    sum = sum + (t.line_length or t.stripes[i].width_in_frames)
    if sum == t.frame_count then
      return #t.stripes / i
    end
  end
end

local function get_stripe_sprite_paths(t, pathTemplate)
  local frameHeight = t.stripes[1].height_in_frames
  local stripeSpritePaths = {}
  for i = 1, #t.stripes do
    local stripesPath = string.gsub(pathTemplate, "&", tostring(i))
    local startSpriteNumber = t.stripes[i].width_in_frames * (((t.stripes[i].y or 0) / t.height)) + 1
    local numberOfSprites = t.stripes[i].width_in_frames * math.min(t.stripes[i].height_in_frames, t.direction_count)
    stripeSpritePaths[i] = create_file_paths(stripesPath, ".png", numberOfSprites, startSpriteNumber)
  end
  return stripeSpritePaths
end

local function get_merged_strips(t, numberOfStripMerges, stripeSpritePaths)
  local frameHeight = t.stripes[1].height_in_frames
  local stripMergedTogether = {}
  local stripMergeTablesLength = #t.stripes / numberOfStripMerges
  for i = 0, numberOfStripMerges - 1 do
    local tablesToStripMerge = {}
    local tableLengths = {}
    for x = 1 + stripMergeTablesLength * i, stripMergeTablesLength + stripMergeTablesLength * i do
      tablesToStripMerge[#tablesToStripMerge + 1] = stripeSpritePaths[x]
      tableLengths[#tableLengths + 1] = t.stripes[x].width_in_frames
    end
    stripMergedTogether[i + 1] = strip_merge(tablesToStripMerge, frameHeight, tableLengths)
  end
  return stripMergedTogether
end

local TEXTURE_CONFIGURATION =
{
  [ENTITY_PATH.."/assembling-machine-1/assembling-machine-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/assembling-machine-2/assembling-machine-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/assembling-machine-2/pipe-north.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/assembling-machine-2/pipe-east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/assembling-machine-2/pipe-south.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/assembling-machine-2/pipe-west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/assembling-machine-3/assembling-machine-3.png"] = function(t) override_animation(t[#t], 4) end,
  [ENTITY_PATH.."/assembling-machine-3/pipe-north.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/assembling-machine-3/pipe-east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/assembling-machine-3/pipe-south.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/assembling-machine-3/pipe-west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/beacon/beacon-base.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/beacon/beacon-antenna.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/electric-mining-drill/north.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/electric-mining-drill/east.png"] = function(t) manual_override_sprite(t[#t], 256, 200, 2) end,
  [ENTITY_PATH.."/electric-mining-drill/south.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/electric-mining-drill/west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/splitter/splitter-north.png"] = function(t) override_animation(t[#t], 8) end,
  [ENTITY_PATH.."/splitter/splitter-east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/splitter/splitter-south.png"] = function(t) override_animation(t[#t], 8) end,
  [ENTITY_PATH.."/splitter/splitter-west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/transport-belt.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/underground-belt/underground-belt-structure.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/accumulator/accumulator.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/accumulator/accumulator-charge-animation.png"] = function(t)
    t[#t].layers =
    {
      {
        width = 124 * 2,
        height = 103 * 2,
        frame_count = 24,
        shift = {0.7, -0.2},
        animation_speed = 0.5,
        scale = 0.5,
        stripes = (function()
          result = {}
          stripe =
          {
            filename = MOD_PATH.."/graphics/entity/accumulator/accumulator.png",
            width_in_frames = 1,
            height_in_frames = 1
          }
          for i = 1,24 do
            result[i] = stripe
          end
          return result
        end)()
      },
      {
        filename = MOD_PATH.."/graphics/entity/accumulator/accumulator-charge-sparks.png",
        width = 138 * 2,
        height = 135  *2,
        line_length = 6,
        frame_count = 24,
        scale = 0.5,
        shift = {0.482, -0.638},
        animation_speed = 0.5
      }
    }
  end,
  [ENTITY_PATH.."/accumulator/accumulator-discharge-animation.png"] = function(t)
    t[#t].layers =
    {
      {
        width = 124 * 2,
        height = 103 * 2,
        frame_count = 24,
        shift = {0.7, -0.2},
        animation_speed = 0.5,
        scale = 0.5,
        stripes = (function()
          result = {}
          stripe =
          {
            filename = MOD_PATH.."/graphics/entity/accumulator/accumulator.png",
            width_in_frames = 1,
            height_in_frames = 1
          }
          for i = 1,24 do
            result[i] = stripe
          end
          return result
        end)()
      },
      {
        filename = MOD_PATH.."/graphics/entity/accumulator/accumulator-discharge-sparks.png",
        width = 147 * 2,
        height = 128 * 2,
        line_length = 6,
        frame_count = 24,
        scale = 0.5,
        shift = {0.395, -0.525},
        animation_speed = 0.5
      }
    }
  end,
  [ENTITY_PATH.."/beam/beam-head.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/beam/beam-tail.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/beam/beam-body-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/beam/beam-body-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/beam/beam-body-3.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/beam/beam-body-4.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/beam/beam-body-5.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/beam/beam-body-6.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/blue-laser/blue-laser.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-01.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-02.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-03.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-04.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-05.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-06.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-07.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-08.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-09.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-10.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-11.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-12.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-13.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-14.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-15.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-16.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-17.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-18.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-19.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-20.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-21.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-22.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-23.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-24.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-25.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-26.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-27.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-28.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/branch-particle/branch-particle-29.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/big-electric-pole/big-electric-pole.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/biter/biter-run-1.png"] = function(t)
    if #t > 2 then
      local part1 = create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-run-1/biter-run-1-", ".png", 128)
      local part2 = create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-run-2/biter-run-2-", ".png", 128)
      local combined = strip_merge({part1, part2}, 16, {8, 8})

      add_stripes(t[#t - 2], 1, 1, combined)
    end
  end,
  [ENTITY_PATH.."/biter/biter-run-mask1.png"] = function(t)
    add_stripes(t[#t], 1, 1, create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-run-mask1/biter-run-mask1-", ".png", 256))
  end,
  [ENTITY_PATH.."/biter/biter-run-mask2.png"] = function(t)
    add_stripes(t[#t], 1, 1, create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-run-mask2/biter-run-mask2-", ".png", 256))
  end,
  [ENTITY_PATH.."/biter/biter-attack-1.png"] = function(t)
    if #t > 2 then
      local part1 = create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-attack-1/biter-attack-1-", ".png", 48)
      local part2 = create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-attack-2/biter-attack-2-", ".png", 40)
      local part3 = create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-attack-3/biter-attack-3-", ".png", 48)
      local part4 = create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-attack-4/biter-attack-4-", ".png", 40)
      local combined1 = strip_merge({part1, part2}, 8, {6, 5})
      local combined2 = strip_merge({part3, part4}, 8, {6, 5})
      local combined  = merge_tables({combined1, combined2})

      add_stripes(t[#t - 2], 1, 1, combined)
    end
  end,
  [ENTITY_PATH.."/biter/biter-attack-mask1.png"] = function(t)
    add_stripes(t[#t], 1, 1, create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-attack-mask1/biter-attack-mask1-", ".png", 176))
  end,
  [ENTITY_PATH.."/biter/biter-attack-mask2.png"] = function(t)
    add_stripes(t[#t], 1, 1, create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-attack-mask2/biter-attack-mask2-", ".png", 176))
  end,
  [ENTITY_PATH.."/biter/biter-die-1.png"] = function(t)
    if #t > 2 then
      local part1 = create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-die-1/biter-die-1-", ".png", 72)
      local part2 = create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-die-2/biter-die-2-", ".png", 64)
      local part3 = create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-die-3/biter-die-3-", ".png", 72)
      local part4 = create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-die-4/biter-die-4-", ".png", 64)
      local combined1 = strip_merge({part1, part2}, 8, {9, 8})
      local combined2 = strip_merge({part3, part4}, 8, {9, 8})
      local combined  = merge_tables({combined1, combined2})

      add_stripes(t[#t - 2], 1, 1, combined)
    end
  end,
  [ENTITY_PATH.."/biter/biter-die-mask1.png"] = function(t)
    add_stripes(t[#t], 1, 1, create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-die-mask1/biter-die-mask1-", ".png", 272))
  end,
  [ENTITY_PATH.."/biter/biter-die-mask2.png"] = function(t)
    add_stripes(t[#t], 1, 1, create_file_paths(MOD_PATH.."/graphics/entity/biter/biter-die-mask2/biter-die-mask2-", ".png", 272))
  end,
  [ENTITY_PATH.."/boiler/boiler-left.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/boiler/boiler-down.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/boiler/boiler-left-down.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/boiler/boiler-right-down.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/boiler/boiler-left-up.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/boiler/boiler-right-up.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/boiler/boiler-t-down.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/boiler/boiler-t-up.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/burner-mining-drill/north.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/burner-mining-drill/east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/burner-mining-drill/south.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/burner-mining-drill/west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/car/car-1.png"] = function(t)
    if #t > 1 and t[#t - 2].stripes ~= nil then
      scale_sprite(t[#t - 2])
      change_animation(t[#t], 4, 11)
      change_animation(t[#t - 2].stripes[2], 4, 11)
      change_animation(t[#t - 2].stripes[3], 4, 10)
    end
  end,
  [ENTITY_PATH.."/car/car-turret.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/chemical-plant/chemical-plant.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/coal/coal.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/coal-particle/coal-particle-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/coal-particle/coal-particle-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/coal-particle/coal-particle-3.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/coal-particle/coal-particle-4.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/copper-ore-particle/copper-ore-particle-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/copper-ore-particle/copper-ore-particle-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/copper-ore-particle/copper-ore-particle-3.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/copper-ore-particle/copper-ore-particle-4.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-entities.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-led-arithmetic-north.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-led-arithmetic-east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-led-arithmetic-south.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-led-arithmetic-west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-led-constant-north.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-led-constant-east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-led-constant-south.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-led-constant-west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-led-decider-north.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-led-decider-east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-led-decider-south.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/combinator/combinator-led-decider-west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-main-h.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-main-ne.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-main-nw.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-main-se.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-main-sw.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-main-v.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-main-x.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-shadow-h.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-shadow-ne.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-shadow-nw.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-shadow-se.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-shadow-sw.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-shadow-v.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-shadow-x.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-main-scanner.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-main-scanner-nw-ne.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/transport-belt/connector/transport-belt-connector-frame-main-scanner-sw-se.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/circuit-connector/circuit-connector-main.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/circuit-connector/circuit-connector-led-red.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/circuit-connector/circuit-connector-led-green.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/circuit-connector/circuit-connector-led-blue.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/circuit-connector/circuit-connector-logistic-animation.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/circuit-connector/circuit-connector-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/circuit-connector/circuit-connector-inserter-main.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/circuit-connector/circuit-connector-inserter-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/circuit-connector/circuit-connector-inserter-led-red.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/circuit-connector/circuit-connector-inserter-led-green.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/circuit-connector/circuit-connector-inserter-led-blue.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/circuit-connector/circuit-connector-logistic-animation.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/crude-oil/crude-oil.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/defender-robot/defender-robot.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/destroyer-robot/destroyer-robot.png"] = function(t)
    add_stripes(t[#t], 16, 2, create_file_paths(MOD_PATH.."/graphics/entity/destroyer-robot/destroyer-robot-", ".png", 2))
    t[#t].line_length = 16
    t[#t].y = nil
  end,
  [ENTITY_PATH.."/destroyer-robot/destroyer-robot-mask.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/distractor-robot/distractor-robot.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/construction-robot/construction-robot.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/construction-robot/construction-robot-working.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/copper-ore/copper-ore.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/curved-rail/curved-rail-vertical-metals.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/curved-rail/curved-rail-vertical-backplates.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/curved-rail/curved-rail-vertical-ties.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/curved-rail/curved-rail-vertical-metals-remnants.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/curved-rail/curved-rail-horizontal-metals.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/curved-rail/curved-rail-horizontal-backplates.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/curved-rail/curved-rail-horizontal-ties.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/curved-rail/curved-rail-horizontal-metals-remnants.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/decorative/brown-asterisk/brown-asterisk-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/brown-cane-cluster/brown-cane-cluster-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/brown-cane-single/brown-cane-single-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/brown-carpet-grass/brown-carpet-grass-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/brown-coral-mini/brown-coral-mini-01.png"] =  function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/brown-fluff/brown-fluff-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/brown-fluff-dry/brown-fluff-dry-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/brown-hairy-grass/brown-hairy-grass-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/garballo/garballo-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/garballo-mini-dry/garballo-mini-dry-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/green-asterisk/green-asterisk-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/green-bush-mini/green-bush-mini-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/green-carpet-grass/green-carpet-grass-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/green-coral-mini/green-coral-mini-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/green-hairy-grass/green-hairy-grass-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/green-small-grass/green-small-grass-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/orange-coral-mini/orange-coral-mini-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/red-asterisk/red-asterisk-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/roots/root-A-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/roots/root-B-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/small-stone-rock/small-stone-rock-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/decorative/stone-rock/stone-rock-01.png"] = function(t) if #t > 1 then override_all_sprites(t[#t - 1]) end end,
  [ENTITY_PATH.."/electric-furnace/electric-furnace-base.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/electric-furnace/electric-furnace-heater.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/electric-furnace/electric-furnace-propeller-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/electric-furnace/electric-furnace-propeller-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/express-splitter/express-splitter-north.png"] = function(t) override_animation(t[#t], 8) end,
  [ENTITY_PATH.."/express-splitter/express-splitter-east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/express-splitter/express-splitter-south.png"] = function(t) override_animation(t[#t], 8) end,
  [ENTITY_PATH.."/express-splitter/express-splitter-west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/express-transport-belt/express-transport-belt.png"] = function(t)
    if t[#t].direction_count == nil then
      local y = t[#t].y or 0
      add_stripes(t[#t], 16, 1,
      {
        MOD_PATH.."/graphics/entity/express-transport-belt/express-transport-belt.png",
        MOD_PATH.."/graphics/entity/express-transport-belt/express-transport-belt.png"
      })
      t[#t].stripes[1].y = y * 2
      t[#t].stripes[2].y = (y * 2) + t[#t].height
      t[#t].y = y * 2
    else
      override_sprite(t[#t])
      t[#t].line_length = 16
    end
  end,
  [ENTITY_PATH.."/express-underground-belt/express-underground-belt-structure.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/explosion/explosion-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/explosion/explosion-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/explosion/explosion-3.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/explosion/explosion-4.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/explosion-gunshot/explosion-gunshot.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/explosion-hit/explosion-hit.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket/rocket.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flame-thrower-explosion/flame-thrower-explosion.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fast-splitter/fast-splitter-north.png"] = function(t) override_animation(t[#t], 8) end,
  [ENTITY_PATH.."/fast-splitter/fast-splitter-east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fast-splitter/fast-splitter-south.png"] = function(t) override_animation(t[#t], 8) end,
  [ENTITY_PATH.."/fast-splitter/fast-splitter-west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fast-transport-belt/fast-transport-belt.png"] = function(t)
    if t[#t].direction_count == nil then
      local y = t[#t].y or 0
      add_stripes(t[#t], 16, 1,
      {
        MOD_PATH.."/graphics/entity/fast-transport-belt/fast-transport-belt.png",
        MOD_PATH.."/graphics/entity/fast-transport-belt/fast-transport-belt.png"
      })
      t[#t].stripes[1].y = y * 2
      t[#t].stripes[2].y = (y * 2) + t[#t].height
      t[#t].y = y * 2
    else
      override_sprite(t[#t])
      t[#t].line_length = 16
    end
  end,
  [ENTITY_PATH.."/fire-flame/fire-flame-1.png"] = function(t) override_sprite(t[#t]) print("stuff") end,
  [ENTITY_PATH.."/fire-flame/fire-flame-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-flame-3.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-flame-4.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-flame-5.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-flame-6.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-flame-7.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-flame-8.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-flame-9.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-flame-10.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-flame-11.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-flame-12.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-flame-13.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/tree-fire-flame-01-a.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/tree-fire-flame-01-b.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/tree-fire-flame-01-c.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/tree-fire-flame-03-a.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/tree-fire-flame-03-b.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/tree-fire-flame-03-c.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/burnt-patch.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-smoke-source-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-flame/fire-smoke-source-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fire-smoke/fire-smoke.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/fire-smoke/fire-smoke/fire-smoke-")
  end,
  [ENTITY_PATH.."/fire-smoke/fire-smoke-glow.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/fire-smoke/fire-smoke-glow/fire-smoke-glow-")
  end,
  [ENTITY_PATH.."/flamethrower-fire-stream/flamethrower-fire-stream-spine.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-fire-stream/flamethrower-explosion.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-base-east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-base-east-mask.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-base-east-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-base-north.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-base-north-mask.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-base-north-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-base-south.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-base-south-mask.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-base-south-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-base-west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-base-west-mask.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-base-west-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-gun.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-gun-active.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-gun-extension.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-gun-extension-mask.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-gun-extension-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-gun-mask.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-gun-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-led-indicator-east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-led-indicator-north.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-led-indicator-south.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-led-indicator-west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/flamethrower-turret/flamethrower-turret-muzzle-fire.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fast-underground-belt/fast-underground-belt-structure.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/gate-vertical.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/gate-horizontal.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/gate-base-vertical.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/gate-rail-horizontal-left.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/gate-rail-horizontal-right.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/gate-rail-vertical-left.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/gate-rail-vertical-right.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/gate-rail-base-vertical.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/gate-rail-base-horizontal.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/gate-base-horizontal.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/gate-base-horizontal-mask.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/wall-patch-north.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/wall-patch-east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/wall-patch-south.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/wall-patch-west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/wall-diode-green.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gate/wall-diode-red.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gun-turret/gun-turret-gun-extension.png"] = function(t) override_sprite(t[#t]) end,
    [ENTITY_PATH.."/gun-turret/gun-turret-base.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/gun-turret/gun-turret-gun-1.png"] = function(t)
    if #t > 2 then
      add_stripes(t[#t - 2], t[#t - 2].frame_count, 16, create_file_paths(MOD_PATH.."/graphics/entity/gun-turret/gun-turret-gun-", ".png", 4))
    end
  end,
  [ENTITY_PATH.."/gun-turret/gun-turret-gun-mask.png"] = function(t)
    add_stripes(t[#t], t[#t].frame_count, 32, create_file_paths(MOD_PATH.."/graphics/entity/gun-turret/gun-turret-gun-mask-", ".png", 2))
  end,
  [ENTITY_PATH.."/inserter/inserter-hand-base.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/inserter/inserter-hand-closed.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/inserter/inserter-hand-open.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/inserter/inserter-platform.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/burner-inserter/burner-inserter-hand-base.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/burner-inserter/burner-inserter-hand-closed.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/burner-inserter/burner-inserter-hand-open.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/burner-inserter/burner-inserter-platform.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/fast-inserter/fast-inserter-hand-base.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/fast-inserter/fast-inserter-hand-closed.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/fast-inserter/fast-inserter-hand-open.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/fast-inserter/fast-inserter-platform.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/filter-inserter/filter-inserter-hand-base.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/filter-inserter/filter-inserter-hand-closed.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/filter-inserter/filter-inserter-hand-open.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/filter-inserter/filter-inserter-platform.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stack-inserter/stack-inserter-hand-base.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/stack-inserter/stack-inserter-hand-closed.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/stack-inserter/stack-inserter-hand-open.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/stack-inserter/stack-inserter-platform.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stack-filter-inserter/stack-filter-inserter-hand-base.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/stack-filter-inserter/stack-filter-inserter-hand-closed.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/stack-filter-inserter/stack-filter-inserter-hand-open.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/stack-filter-inserter/stack-filter-inserter-platform.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/iron-ore/iron-ore.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/iron-ore-particle/iron-ore-particle-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/iron-ore-particle/iron-ore-particle-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/iron-ore-particle/iron-ore-particle-3.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/iron-ore-particle/iron-ore-particle-4.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/lab/lab.png"] = function(t)
    if t[#t].line_length ~= nil then
      override_animation(t[#t], 3)
    else
      override_sprite(t[#t])
    end
  end,
  [ENTITY_PATH.."/land-mine/land-mine.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/land-mine/land-mine-set.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/laser-turret/laser-turret-base.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/laser-turret/laser-turret-gun.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/laser-turret/laser-turret-gun-start.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/logistic-robot/logistic-robot.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/long-handed-inserter/long-handed-inserter-hand-base.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/long-handed-inserter/long-handed-inserter-hand-closed.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/long-handed-inserter/long-handed-inserter-hand-open.png"] = function(t) override_sprite(t[#t], 1) end,
  [ENTITY_PATH.."/long-handed-inserter/long-handed-inserter-platform.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/market/market.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/medium-electric-pole/medium-electric-pole.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/medium-explosion/medium-explosion.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/offshore-pump/offshore-pump.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/oil-refinery/oil-refinery.png"] = function(t)
    if #t > 1 and t[#t - 1].north ~= nil and t[#t - 1].east ~= nil and t[#t - 1].west ~= nil and t[#t - 1].south ~= nil then
      override_all_sprites(t[#t - 1])
      t[#t - 1].south.x = 0
      t[#t - 1].south.y = t[#t - 1].south.height
      t[#t - 1].west.x = t[#t - 1].west.width
      t[#t - 1].west.y = t[#t - 1].west.height
    end
  end,
  [ENTITY_PATH.."/pipe/pipe-straight-vertical.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-straight-vertical-window.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-straight-horizontal-window.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-straight-horizontal.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-corner-up-right.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-corner-up-left.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-corner-down-right.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-corner-down-left.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-t-up.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-t-down.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-t-right.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-t-left.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-cross.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-ending-up.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-ending-down.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-ending-right.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-ending-left.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-horizontal-window-background.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe/pipe-vertical-window-background.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe-covers/pipe-cover-north.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe-covers/pipe-cover-east.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe-covers/pipe-cover-south.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe-covers/pipe-cover-west.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe-to-ground/pipe-to-ground-up.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe-to-ground/pipe-to-ground-down.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe-to-ground/pipe-to-ground-left.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pipe-to-ground/pipe-to-ground-right.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/power-switch/power-switch.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/power-switch/power-switch-electricity-start.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/power-switch/power-switch-electricity-loop.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/power-switch/power-switch-led.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pumpjack/pumpjack-base.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/pumpjack/pumpjack-animation.png"] = function(t)
    override_sprite(t[#t])
    t[#t].line_length = 5
  end,
  [ENTITY_PATH.."/radar/radar.png"] = function(t)
    scale_sprite(t[#t])
    t[#t].direction_count = 64
    t[#t].lines_per_file = 1
    t[#t].line_length = 4
    t[#t].filename = nil
    t[#t].filenames = create_file_paths(MOD_PATH.."/graphics/entity/radar/radar", ".png", 16)
  end,
  [ENTITY_PATH.."/rail-chain-signal/rail-chain-signal.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rail-chain-signal/rail-chain-signal-metal.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/remnants/big-remnants.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/remnants/medium-remnants.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/remnants/small-remnants.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/remnants/big-remnants-ground-patch.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/remnants/medium-remnants-ground-patch.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/remnants/small-remnants-ground-patch.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/player/player-basic-idle.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-basic-idle/player-basic-idle-", ".png")
  end,
  [ENTITY_PATH.."/player/player-basic-idle-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-basic-idle-color/player-basic-idle-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-basic-idle-gun.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-basic-idle-gun/player-basic-idle-gun-", ".png")
  end,
  [ENTITY_PATH.."/player/player-basic-idle-gun-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-basic-idle-gun-color/player-basic-idle-gun-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-basic-mine.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-basic-mine/player-basic-mine-", ".png")
  end,
  [ENTITY_PATH.."/player/player-basic-mine-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-basic-mine-color/player-basic-mine-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-basic-mine-tool.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-basic-mine-tool/player-basic-mine-tool-", ".png")
  end,
  [ENTITY_PATH.."/player/player-basic-mine-tool-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-basic-mine-tool-color/player-basic-mine-tool-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-basic-run-gun.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-basic-run-gun/player-basic-run-gun-", ".png")
  end,
  [ENTITY_PATH.."/player/player-basic-run-gun-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-basic-run-gun-color/player-basic-run-gun-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-basic-run.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-basic-run/player-basic-run-", ".png")
  end,
  [ENTITY_PATH.."/player/player-basic-run-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-basic-run-color/player-basic-run-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor1-idle.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor1-idle/player-armor1-idle-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor1-idle-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor1-idle-color/player-armor1-idle-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor1-idle-gun.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor1-idle-gun/player-armor1-idle-gun-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor1-idle-gun-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor1-idle-gun-color/player-armor1-idle-gun-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor1-mine.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor1-mine/player-armor1-mine-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor1-mine-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor1-mine-color/player-armor1-mine-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor1-mine-tool.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor1-mine-tool/player-armor1-mine-tool-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor1-mine-tool-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor1-mine-tool-color/player-armor1-mine-tool-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor1-run-gun.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor1-run-gun/player-armor1-run-gun-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor1-run-gun-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor1-run-gun-color/player-armor1-run-gun-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor1-run.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor1-run/player-armor1-run-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor1-run-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor1-run-color/player-armor1-run-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor2-idle.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor2-idle/player-armor2-idle-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor2-idle-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor2-idle-color/player-armor2-idle-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor2-idle-gun.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor2-idle-gun/player-armor2-idle-gun-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor2-idle-gun-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor2-idle-gun-color/player-armor2-idle-gun-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor2-mine.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor2-mine/player-armor2-mine-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor2-mine-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor2-mine-color/player-armor2-mine-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor2-mine-tool.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor2-mine-tool/player-armor2-mine-tool-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor2-mine-tool-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor2-mine-tool-color/player-armor2-mine-tool-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor2-run-gun.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor2-run-gun/player-armor2-run-gun-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor2-run-gun-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor2-run-gun-color/player-armor2-run-gun-color-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor2-run.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor2-run/player-armor2-run-", ".png")
  end,
  [ENTITY_PATH.."/player/player-armor2-run-color.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/player/player-armor2-run-color/player-armor2-run-color-", ".png")
  end,
  [ENTITY_PATH.."/rail-signal/rail-signal.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/roboport/roboport-base.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/roboport/roboport-base-patch.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/roboport/roboport-base-animation.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/roboport/roboport-door-up.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/roboport/roboport-door-down.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/01-hole/01-hole.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/01-hole/01-hole-light.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/04-05-doors/04-door-back.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/04-05-doors/05-door-front.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/06-silo-base/06-silo-base-day.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/06-silo-base/06-silo-base-night.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/08-arms-back-satellite-animation/satellite.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/08-arms-back-satellite-animation/arm-01-back.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/08-arms-back-satellite-animation/arm-02-right.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/13-arm-front-red-lights-front/arm-03-front.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/14-silo-front/14-silo-front.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/02-11-rocket/02-rocket.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/10-rocket-under/jet-flame.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/10-rocket-under/jet-flame.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/rocket-silo/10-rocket-under/jet-flame.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/small-electric-pole/small-electric-pole.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/small-lamp/light-off.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/small-pump/small-pump-up.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/small-pump/small-pump-right.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/small-pump/small-pump-down.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/small-pump/small-pump-left.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/small-lamp/light-off.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/scorchmark/small-scorchmark.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/slowdown-sticker/slowdown-sticker.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/big-ship-wreck-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/big-ship-wreck-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/big-ship-wreck-3.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/big-ship-wreck-grass.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/medium-ship-wreck-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/medium-ship-wreck-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/small-ship-wreck-a.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/small-ship-wreck-b.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/small-ship-wreck-c.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/small-ship-wreck-d.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/small-ship-wreck-e.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/small-ship-wreck-f.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/small-ship-wreck-g.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/small-ship-wreck-h.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/small-ship-wreck-i.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/small-ship-wreck-grass-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/small-ship-wreck-grass-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/ship-wreck/small-ship-wreck-grass-3.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/solar-panel/solar-panel.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/sparks/sparks-01.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/sparks/sparks-02.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/sparks/sparks-03.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/sparks/sparks-04.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/sparks/sparks-05.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/sparks/sparks-06.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/smoke-construction/smoke-01.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/smoke/smoke/smoke-")
  end,
  [ENTITY_PATH.."/smoke-construction/smoke-01.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/smoke-fast/smoke-fast.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/spawner/spawner-idle.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/spawner/spawner-idle/spawner-idle-", ".png")
  end,
  [ENTITY_PATH.."/spawner/spawner-idle-mask.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/spawner/spawner-idle-mask/spawner-idle-mask-", ".png")
  end,
  [ENTITY_PATH.."/spawner/spawner-die-01.png"] = function(t)
    if #t > 2 then
      texture_to_sprites_converter(t[#t - 2], MOD_PATH.."/graphics/entity/spawner/spawner-die-0&/spawner-die-0&-")
    end
  end,
  [ENTITY_PATH.."/spawner/spawner-die-mask-01.png"] = function(t)
    if #t > 2 then
      texture_to_sprites_converter(t[#t - 2], MOD_PATH.."/graphics/entity/spawner/spawner-die-mask-0&/spawner-die-mask-0&-")
    end
  end,
  [ENTITY_PATH.."/spitter/spitter-attack-1.png"] = function(t)
    if #t > 2 then
      texture_to_sprites_converter(t[#t - 2], MOD_PATH.."/graphics/entity/spitter/spitter-attack-&/spitter-attack-&-")
    end
  end,
  [ENTITY_PATH.."/spitter/spitter-attack-mask-1.png"] = function(t)
    if #t > 2 then
      texture_to_sprites_converter(t[#t - 2], MOD_PATH.."/graphics/entity/spitter/spitter-attack-mask-&/spitter-attack-mask-&-")
    end
  end,
  [ENTITY_PATH.."/spitter/spitter-run-1.png"] = function(t)
    if #t > 2 then
      texture_to_sprites_converter(t[#t - 2], MOD_PATH.."/graphics/entity/spitter/spitter-run-&/spitter-run-&-")
    end
  end,
  [ENTITY_PATH.."/spitter/spitter-run-mask.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/spitter/spitter-run-mask/spitter-run-mask-")
  end,
  [ENTITY_PATH.."/spitter/spitter-die-1.png"] = function(t)
    if #t > 2 then
      texture_to_sprites_converter(t[#t - 2], MOD_PATH.."/graphics/entity/spitter/spitter-die-&/spitter-die-&-")
    end
  end,
  [ENTITY_PATH.."/spitter/spitter-die-mask-1.png"] = function(t)
    if #t > 2 then
      texture_to_sprites_converter(t[#t - 2], MOD_PATH.."/graphics/entity/spitter/spitter-die-mask-&/spitter-die-mask-&-")
    end
  end,
  [ENTITY_PATH.."/steam-engine/steam-engine-horizontal.png"] = function(t)
    add_stripes(t[#t], 4, 2, create_file_paths(MOD_PATH.."/graphics/entity/steam-engine/steam-engine-horizontal-", ".png", 4))
    t[#t].line_length = nil
  end,
  [ENTITY_PATH.."/steam-engine/steam-engine-vertical.png"] = function(t)
    add_stripes(t[#t], 4, 4, create_file_paths(MOD_PATH.."/graphics/entity/steam-engine/steam-engine-vertical-", ".png", 2))
    t[#t].line_length = nil
  end,
  [ENTITY_PATH.."/steel-furnace/steel-furnace.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/steel-furnace/steel-furnace-fire.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/steel-furnace/steel-furnace-glow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/steel-furnace/steel-furnace-working-lighting.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone/stone.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-particle/stone-particle-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-particle/stone-particle-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-particle/stone-particle-3.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-particle/stone-particle-4.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-furnace/stone-furnace.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-furnace/stone-furnace-fire.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-single.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-single-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-straight-vertical-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-straight-vertical-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-straight-vertical-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-straight-vertical-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-straight-vertical-3.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-straight-vertical-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-straight-horizontal-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-straight-horizontal-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-straight-horizontal-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-straight-horizontal-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-straight-horizontal-3.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-straight-horizontal-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-corner-right-down.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-corner-right-down-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-corner-left-down.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-corner-left-down-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-t-down.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-t-down-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-ending-right.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-ending-right-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-ending-left.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/wall-ending-left-shadow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/remains/wall-remain-01.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/remains/wall-remain-02.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/remains/wall-remain-03.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/remains/wall-remain-04.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/remains/wall-remain-05.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/remains/wall-remain-06.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/remains/wall-remain-07.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/stone-wall/remains/wall-remain-08.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/storage-tank/storage-tank.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/straight-rail/straight-rail-vertical-metals.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/straight-rail/straight-rail-vertical-backplates.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/straight-rail/straight-rail-vertical-ties.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/straight-rail/straight-rail-vertical-metals-remnants.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/straight-rail/straight-rail-horizontal-metals.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/straight-rail/straight-rail-horizontal-backplates.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/straight-rail/straight-rail-horizontal-ties.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/straight-rail/straight-rail-horizontal-metals-remnants.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/substation/substation.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/tank/base-1.png"] = function(t)
    if #t > 2 and #t[#t - 1] == 4 then
      scale_sprite(t[#t - 2])
      change_animation(t[#t], 4, 8)
      change_animation(t[#t - 1][2], 4, 8)
      change_animation(t[#t - 1][3], 4, 8)
      change_animation(t[#t - 1][4], 4, 8)
    end
  end,
  [ENTITY_PATH.."/tank/turret.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-bottom.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-ground.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-shadow.png"] = function(t)
    texture_to_sprites_converter(t[#t], MOD_PATH.."/graphics/entity/train-stop/train-stop-shadow/train-stop-shadow-")
  end,
  [ENTITY_PATH.."/train-stop/train-stop-top.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-top-mask.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-north-light-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-north-light-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-north-light-2-glow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-south-light-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-south-light-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-south-light-2-glow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-east-light-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-east-light-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-east-light-2-glow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-west-light-1.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-west-light-2.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/train-stop/train-stop-west-light-2-glow.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/water-splash/water-splash.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/worm/worm-folded.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/worm/worm-folded-mask.png"] = function(t) override_sprite(t[#t]) end,
  [ENTITY_PATH.."/worm/worm-preparing-01.png"] = function(t)
    if #t > 2 then
      local part1 = create_file_paths(MOD_PATH.."/graphics/entity/worm/worm-preparing-01/worm-preparing-01-", ".png", 14)
      local part2 = create_file_paths(MOD_PATH.."/graphics/entity/worm/worm-preparing-02/worm-preparing-02-", ".png", 12)
      local combined = merge_tables({part1, part2})

      add_stripes(t[#t - 2], 1, 1, combined)
    end
  end,
  [ENTITY_PATH.."/worm/worm-preparing-mask.png"] = function(t)
    add_stripes(t[#t], 1, 1, create_file_paths(MOD_PATH.."/graphics/entity/worm/worm-preparing-mask/worm-preparing-mask-", ".png", 26))
  end,
  [ENTITY_PATH.."/worm/worm-prepared.png"] = function(t)
    add_stripes(t[#t], 1, 1, create_file_paths(MOD_PATH.."/graphics/entity/worm/worm-prepared/worm-prepared-", ".png", 10))
  end,
  [ENTITY_PATH.."/worm/worm-prepared-mask.png"] = function(t)
    add_stripes(t[#t], 1, 1, create_file_paths(MOD_PATH.."/graphics/entity/worm/worm-prepared-mask/worm-prepared-mask-", ".png", 10))
  end,
  [ENTITY_PATH.."/worm/worm-attack-01.png"] = function(t)
    if #t > 2 then
      local part1 = create_file_paths(MOD_PATH.."/graphics/entity/worm/worm-attack-01/worm-attack-01-", ".png", 64)
      local part2 = create_file_paths(MOD_PATH.."/graphics/entity/worm/worm-attack-02/worm-attack-02-", ".png", 64)
      local combined = merge_tables({part1, part2})

      add_stripes(t[#t - 2], 1, 1, combined)
    end
  end,
  [ENTITY_PATH.."/worm/worm-attack-mask-01.png"] = function(t)
    if #t > 2 then
      local part1 = create_file_paths(MOD_PATH.."/graphics/entity/worm/worm-attack-mask-01/worm-attack-mask-01-", ".png", 64)
      local part2 = create_file_paths(MOD_PATH.."/graphics/entity/worm/worm-attack-mask-02/worm-attack-mask-02-", ".png", 64)
      local combined = merge_tables({part1, part2})

      add_stripes(t[#t - 2], 1, 1, combined)
    end
  end,
  [ENTITY_PATH.."/worm/worm-die.png"] = function(t)
    add_stripes(t[#t], 1, 1, create_file_paths(MOD_PATH.."/graphics/entity/worm/worm-die/worm-die-", ".png", 24))
  end,
  [ENTITY_PATH.."/worm/worm-die-mask.png"] = function(t)
    add_stripes(t[#t], 1, 1, create_file_paths(MOD_PATH.."/graphics/entity/worm/worm-die-mask/worm-die-mask-", ".png", 24))
  end,
  ["__core__/graphics/cursor-boxes.png"] = function(t)
    manual_override_sprite(t, 128, 128, 4, MOD_PATH.."/graphics/style/cursor-boxes.png")
  end,
  ["__core__/graphics/cursor-boxes-32x32.png"] = function(t)
    manual_override_sprite(t, 128, 128, 4, MOD_PATH.."/graphics/style/cursor-boxes-32x32.png")
  end,
}

function recursive_override_base_textures(t)
  for k,v in pairs(t[#t]) do
    if type(v) == "string" then
      if TEXTURE_CONFIGURATION[v] ~= nil and k ~= "icon" then
        TEXTURE_CONFIGURATION[v](t)
        return true
      end
    elseif type(v) == "table" and v.hr_version == nil then
      local index = #t + 1
      t[index] = v
      recursive_override_base_textures(t)
      t[index] = nil
    end
  end
end

for k, v in pairs(data.raw) do
  for k1, v1 in pairs(v) do
    if not BANNED_TYPES[v1.type] and allow_change(v1.name) then
      recursive_override_base_textures({v1})
    end
  end
end
