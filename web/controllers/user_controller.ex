defmodule BaseAuthPhoenix.UserController do
  use BaseAuthPhoenix.Web, :controller

  alias BaseAuthPhoenix.Profile.UserService
  alias BaseAuthPhoenix.API.UserView

  def register(conn, params) do
    with {:ok, user} <- UserService.create_user(params) do
      conn
      |> put_status(200)
      |> render(UserView, "show.json", user: user)
    end
  end

  def index(conn, _params) do
    users = UserService.list_users()

    conn
    |> put_status(200)
    |> render(UserView, "index.json", users: users)
  end
end
