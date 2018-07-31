defmodule BaseAuthPhoenix.UserController do
  use BaseAuthPhoenix.Web, :controller

  alias BaseAuthPhoenix.Profile
  alias BaseAuthPhoenix.UserView

  def register(conn, _params) do
    with {:ok, body, conn} = read_body(conn),
         {:ok, user} <- Profile.create_user(Poison.decode!(body)) do
      conn
      |> put_status(200)
      |> render(UserView, "show.json", user: user)
    end
  end

  def index(conn, _params) do
    with users = Profile.list_users() do
      conn
      |> put_status(200)
      |> render(UserView, "index.json", users: users)
    end
  end
end
