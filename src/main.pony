use "IO"
use "files"

actor Main
  new create(env: Env) =>
    try
      let auth = env.root as AmbientAuth
      let file = recover File(FilePath(auth, "out.txt")?) end
      let fileStream = FileStream(consume file)

      var engine = recover Engine(fileStream) end

      var inputNotifier = recover InputNotifier(env, consume engine) end
      env.input(consume inputNotifier, 512)
    else
      env.err.print("Couldn't initialize dependencies")
    end