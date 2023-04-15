defmodule BcryptRust do
  @moduledoc """
  Hash and verify bcrypt hashed passwords.

  This library is a small wrapper around [rust-bcrypt](https://github.com/Keats/rust-bcrypt) and uses [RustlerPrecompiled](https://github.com/philss/rustler_precompiled) so you don't need to have a rust or c compiler installed to use it.
  """

  @type plaintext :: binary
  @type hash_string :: binary
  @type bcrypt_version :: :a | :x | :y | :b

  @doc """
  Generate a bcrypt hash
  ```elixir
  iex> {:ok, hash} = BcryptRust.hash("testing")
  iex> String.starts_with?(hash, "$2b$")
  true
  ```
  """
  @spec hash(plaintext) :: {:ok, hash_string} | {:error, binary}
  defdelegate hash(password), to: BcryptRust.Native

  @doc """
  Generate a hash using the specified version. Mostly used for debugging or interacting with older (legacy) systems.

  ```elixir
  iex> {:ok, hash} = BcryptRust.hash_with_version("testing", :a)
  iex> String.starts_with?(hash, "$2a$")
  true
  ```
  """
  @spec hash_with_version(plaintext, bcrypt_version) :: {:ok, hash_string} | {:error, binary}
  defdelegate hash_with_version(password, version), to: BcryptRust.Native

  @doc """
  Verify password against a bcrypt hash
  ```elixir
  iex> {:ok, hash} = BcryptRust.hash("testing")
  iex> BcryptRust.verify("testing", hash)
  {:ok, true}
  iex> BcryptRust.verify("other", hash)
  {:ok, false}
  iex> BcryptRust.verify("testing", "testing")
  {:error, "Invalid hash: testing"}
  ```
  """
  @spec verify(plaintext, hash_string) :: {:ok, boolean} | {:error, binary}
  defdelegate verify(password, hash), to: BcryptRust.Native
end
