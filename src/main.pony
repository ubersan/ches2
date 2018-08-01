use "IO"

use "term"

actor Main
  new create(env: Env) =>
    let notifier = recover InputNotifier(env) end
    env.input(consume notifier)