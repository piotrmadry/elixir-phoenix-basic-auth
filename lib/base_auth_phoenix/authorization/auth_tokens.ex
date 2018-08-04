defmodule BaseAuthPhoenix.Authorization.AuthTokens do
  use Ecto.Schema
  import Ecto.Changeset

  schema "auth" do
    field(:user_id, :string, null: false)
    field(:token, :string, null: false)
    field(:refresh_token, :string, null: false)
    field(:expires_in, :integer, null: false)
    timestamps()
  end

  @doc false
  def changeset(auth_tokens, attrs) do
    auth_tokens
    |> cast(attrs, [:user_id, :token, :refresh_token, :expires_in])
    |> validate_required([:user_id, :token, :refresh_token, :expires_in])
    |> unique_constraint(:user_id)
  end
end
