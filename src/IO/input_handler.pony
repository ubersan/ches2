class InputNotifier
  let _env: Env
  var _buf: Array[U8] iso
  var _inEscapeMode: Bool

  new create(env': Env) =>
    _env = env'
    _buf = recover iso Array[U8] end
    _inEscapeMode = false

  fun ref apply(data: Array[U8] iso) =>
    for char in (consume data).values() do
      if _lineHasEnded(char) then
        let bufferOutIso = _buf = recover iso Array[U8] end
        _env.out.print(consume bufferOutIso)
      else
        if not _inEscapeMode then
          _buf.push(char)
        end
      end
    end

  fun ref _lineHasEnded(char: U8): Bool =>
    let isNewline = _checkForNewline(char)
    _updateEscapeMode(char)
    isNewline

  fun ref _checkForNewline(char: U8): Bool =>
    _inEscapeMode and (char == 'n')
  
  fun ref _updateEscapeMode(char: U8) =>
    if char == '\\' then
      _inEscapeMode = true
    else
      _inEscapeMode = false
    end

  fun ref dispose() =>
    _env.out.print("disposed")