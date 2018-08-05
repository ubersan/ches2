class Engine
  let _out: OutStream

  new create(out: OutStream) =>
    _out = out
    //_out.print("Engine started, waiting for commands ...")

  fun ref apply(command: Array[U8] iso) =>
    _out.print(String.from_array(consume command))
