local main = {}

function main.init(e)
  if remote.interfaces.freeplay then
    remote.call("freeplay", "set_disable_crashsite", true)
  end
end

return {
  on_init = main.init,
}
