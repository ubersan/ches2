class InputNotifier
  let _env: Env
  var _buf: Array[U8] iso
  let _engine: Engine

  new create(env': Env, engine: Engine) =>
    _env = env'
    _buf = recover iso Array[U8] end
    _engine = engine

  fun ref apply(data: Array[U8] iso) =>
    for char in (consume data).values() do
      if char == '\n' then
        let bufferOutIso = _buf = recover iso Array[U8] end
        _engine(consume bufferOutIso)
      else
        _buf.push(char)
      end
    end

  fun ref dispose() =>
    _env.out.print("disposed")