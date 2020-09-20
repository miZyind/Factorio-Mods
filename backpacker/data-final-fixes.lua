local FACTOR = 10

local function calc_size(default)
  if default == nil then default = 1 end

  local size = default * FACTOR

  if size > default then
    return (size)
  else
    return default
  end
end

-- Item
for _, datum in pairs(data.raw) do
  for _, item in pairs(datum) do
    if item.stack_size and type(item.stack_size) == "number" and item.stack_size > 1 then
      item.stack_size = calc_size(item.stack_size)
    end
  end
end

-- Ammunition
for _, ammunition in pairs(data.raw.ammo) do
  ammunition.magazine_size = calc_size(ammunition.magazine_size)
end

-- Module
for _, module in pairs(data.raw.module) do
  module.stack_size = calc_size(module.stack_size)
end

-- Capsule
for _, capsule in pairs(data.raw.capsule) do
  capsule.stack_size = calc_size(capsule.stack_size)
end
