defmodule BcryptRustTest do
  use ExUnit.Case
  doctest BcryptRust

  test "hash" do
    assert {:ok, "$2b$12$" <> _} = BcryptRust.hash("testing")
  end

  describe "verify" do
    test "version a" do
      assert {:ok, true} ==
               BcryptRust.verify(
                 "testing",
                 "$2a$12$4KBqu1ndz2I/6RooARBIa.XbuDzqv/vNFjsqU2VLEiBIFfYTgpzha"
               )
    end

    test "version b" do
      assert {:ok, true} ==
               BcryptRust.verify(
                 "testing",
                 "$2b$12$TG9iiyVPfVlwwLdTAFpo4OSVmHZKnZYQSsHPHVnhfDTRoOLP9QcEG"
               )
    end

    test "version x" do
      assert {:ok, true} ==
               BcryptRust.verify(
                 "testing",
                 "$2x$12$dxhhh1KMGy3IYvYW3XNEbucSoa6cwUXwIRyu7L/sxsKuUQnjPIffq"
               )
    end

    test "version y" do
      assert {:ok, true} ==
               BcryptRust.verify(
                 "testing",
                 "$2y$12$djoPZ4sOpwCO3pFtZ2mL0eXGu4sjaQdp1Kj4eQSVth8Ywuvt3acMy"
               )
    end
  end
end
