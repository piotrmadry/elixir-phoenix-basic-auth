defmodule BaseAuthPhoenix.Authroization.AuthTokens do
  use Ecto.Schema
  import Ecto.Changeset

  schema "auth" do
    field :token, :string, null: false
    field :refresh_token, :string, null: false
    timestamps()
  end

  @doc false
  def changeset(auth_tokens, attrs) do
    auth_tokens
    |> cast(attrs, [:token, :refresh_token])
    |> validate_required([:token, :refresh_token])
  end
end
