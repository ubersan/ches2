use "IO"

actor Main
  new create(env: Env) =>
    var inputNotifier = recover InputNotifier(env) end
    env.input(consume inputNotifier, 512)