use "term"
use "promises"

class InputHandler is ReadlineNotify
    
    fun ref apply(line: String, prompt: Promise[String]) =>
        prompt.reject()

class InputNotifier is InputNotify
  let _terminal: ANSITerm

  new create(env: Env) =>
    _terminal = ANSITerm(
      Readline(recover InputHandler end, env.out),
      env.input)
    _terminal.prompt("0 > ")

  fun ref apply(data: Array[U8] iso) =>
    _terminal(consume data)

  fun ref dispose() =>
    _terminal.dispose()