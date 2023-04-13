defmodule BcryptRust.Native do
  use Rustler, otp_app: :bcrypt_rust, crate: "bcrypt_native"

  # When your NIF is loaded, it will override this function.
  def hash(_password), do: :erlang.nif_error(:nif_not_loaded)
  def verify(_password, _hash), do: :erlang.nif_error(:nif_not_loaded)
  def hash_with_version(_password, _version), do: :erlang.nif_error(:nif_not_loaded)
end
