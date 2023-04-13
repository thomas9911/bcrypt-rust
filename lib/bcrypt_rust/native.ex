defmodule BcryptRust.Native do
  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :bcrypt_rust,
    crate: "bcrypt_native",
    base_url: "https://github.com/thomas9911/bcrypt-rust/releases/download/v#{version}",
    version: version

  # When your NIF is loaded, it will override this function.
  def hash(_password), do: :erlang.nif_error(:nif_not_loaded)
  def verify(_password, _hash), do: :erlang.nif_error(:nif_not_loaded)
  def hash_with_version(_password, _version), do: :erlang.nif_error(:nif_not_loaded)
end
