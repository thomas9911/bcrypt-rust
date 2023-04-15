# BcryptRust

Hash and verify bcrypt hashed passwords.

This library is a small wrapper around
[rust-bcrypt](https://github.com/Keats/rust-bcrypt) and uses
[RustlerPrecompiled](https://github.com/philss/rustler_precompiled) so you don't
need to have a rust or c compiler installed to use it.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bcrypt_rust` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bcrypt_rust, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with
[ExDoc](https://github.com/elixir-lang/ex_doc) and published on
[HexDocs](https://hexdocs.pm). Once published, the docs can be found at
<https://hexdocs.pm/bcrypt_rust>.

## Release process

- Merge to main
- Run tag.sh script
- Wait for artifacts are uploaded and released
- Run generate_checksum.sh
- Push that file to main

