defmodule BaseAuthPhoenix.Authorization.AuthService do
  import Ecto.Query, warn: false

  alias BaseAuthPhoenix.Repo
  alias BaseAuthPhoenix.Profile.UserService
  alias BaseAuthPhoenix.Profile.User
  alias BaseAuthPhoenix.Authorization.AuthTokens

  def generate_token(%{"email" => email, "password" => password}) do
    with %User{} = user <- UserService.get_user_by_email(email),
         {:ok, user} <- verify_password(password, user),
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

  def generate_token(_) do
    Bcrypt.no_user_verify()
    {:error, :missing_credentials}
  end

  def add_or_update_token(attrs \\ %{}) do
    %AuthTokens{}
    |> AuthTokens.changeset(attrs)
    |> Repo.insert_or_update(on_conflict: :replace_all, conflict_target: :user_id)
  end

  def verify_password(password, user) do
    if Bcrypt.verify_pass(password, user.crypted_password) do
      {:ok, user}
    else
      {:error, :wrong_credentials}
    end
  end
end
