defmodule BcryptRust do
  @moduledoc """
  Documentation for `BcryptRust`.
  """

  defdelegate hash(password), to: BcryptRust.Native
  defdelegate verify(password, hash), to: BcryptRust.Native
end
