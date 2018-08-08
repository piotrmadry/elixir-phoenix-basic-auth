defmodule BaseAuthPhoenix.Profile.UserService do
  import Ecto.Query, warn: false

  alias BaseAuthPhoenix.Repo
  alias BaseAuthPhoenix.Profile.User

  def get_user_by_email(email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, :wrong_credentials}
      user -> user
    end
  end

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
