defmodule BaseAuthPhoenix.AuthroizationTest do
  use BaseAuthPhoenix.DataCase

  alias BaseAuthPhoenix.Authroization

  describe "auth" do
    alias BaseAuthPhoenix.Authroization.AuthTokens

    @valid_attrs %{age: 42, name: "some name"}
    @update_attrs %{age: 43, name: "some updated name"}
    @invalid_attrs %{age: nil, name: nil}

    def auth_tokens_fixture(attrs \\ %{}) do
      {:ok, auth_tokens} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Authroization.create_auth_tokens()

      auth_tokens
    end

    test "list_auth/0 returns all auth" do
      auth_tokens = auth_tokens_fixture()
      assert Authroization.list_auth() == [auth_tokens]
    end

    test "get_auth_tokens!/1 returns the auth_tokens with given id" do
      auth_tokens = auth_tokens_fixture()
      assert Authroization.get_auth_tokens!(auth_tokens.id) == auth_tokens
    end

    test "create_auth_tokens/1 with valid data creates a auth_tokens" do
      assert {:ok, %AuthTokens{} = auth_tokens} = Authroization.create_auth_tokens(@valid_attrs)
      assert auth_tokens.age == 42
      assert auth_tokens.name == "some name"
    end

    test "create_auth_tokens/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Authroization.create_auth_tokens(@invalid_attrs)
    end

    test "update_auth_tokens/2 with valid data updates the auth_tokens" do
      auth_tokens = auth_tokens_fixture()
      assert {:ok, auth_tokens} = Authroization.update_auth_tokens(auth_tokens, @update_attrs)
      assert %AuthTokens{} = auth_tokens
      assert auth_tokens.age == 43
      assert auth_tokens.name == "some updated name"
    end

    test "update_auth_tokens/2 with invalid data returns error changeset" do
      auth_tokens = auth_tokens_fixture()
      assert {:error, %Ecto.Changeset{}} = Authroization.update_auth_tokens(auth_tokens, @invalid_attrs)
      assert auth_tokens == Authroization.get_auth_tokens!(auth_tokens.id)
    end

    test "delete_auth_tokens/1 deletes the auth_tokens" do
      auth_tokens = auth_tokens_fixture()
      assert {:ok, %AuthTokens{}} = Authroization.delete_auth_tokens(auth_tokens)
      assert_raise Ecto.NoResultsError, fn -> Authroization.get_auth_tokens!(auth_tokens.id) end
    end

    test "change_auth_tokens/1 returns a auth_tokens changeset" do
      auth_tokens = auth_tokens_fixture()
      assert %Ecto.Changeset{} = Authroization.change_auth_tokens(auth_tokens)
    end
  end
end
