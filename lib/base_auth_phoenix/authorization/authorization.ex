defmodule BaseAuthPhoenix.Authorization do
  import Ecto.Query, warn: false

  alias BaseAuthPhoenix.Repo
  alias BaseAuthPhoenix.Profile.User
  alias BaseAuthPhoenix.Authorization.AuthTokens
  alias BaseAuthPhoenix.Profile

  def generate_token(%{"email" => email, "password" => password}) do
    with %User{} = user <-
           Profile.get_user_by_email(
             email,
             Bcrypt.hash_pwd_salt(password)
           ),
         {:ok, tokens} <-
           add_or_update_token(%{
             user_id: user.id,
             token: Ecto.UUID.generate(),
             refresh_token: Ecto.UUID.generate(),
             expires_in: 10000
           }) do
      {:ok, tokens}
    end
  end

  def generate_token(_), do: {:error, :wrong_credentials}

  def add_or_update_token(attrs \\ %{}) do
    %AuthTokens{}
    |> AuthTokens.changeset(attrs)
    |> Repo.insert_or_update(on_conflict: :replace_all, conflict_target: :user_id)
  end
end
