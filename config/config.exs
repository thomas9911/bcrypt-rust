import Config

config :rustler_precompiled, :force_build,
  bcrypt_rust: System.get_env("RUSTLER_PRECOMPILATION_EXAMPLE_BUILD") in ["1", "true", nil]
