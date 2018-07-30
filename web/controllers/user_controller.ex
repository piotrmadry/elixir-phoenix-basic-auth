defmodule BaseAuthPhoenix.UserController do
  use BaseAuthPhoenix.Web, :controller

  def register(conn, _params) do
    with {:ok, body, conn} = Plug.Conn.read_body(conn),
         {:ok, user} <- BaseAuthPhoenix.Profile.create_user(Poison.decode!(body)) do
      conn
      |> put_status(200)
      |> render(BaseAuthPhoenix.UserView, "show.json", user: user)
    end
  end

  def index(conn, _params) do
    users = BaseAuthPhoenix.Profile.list_users()
    render(conn, "index.json", users: users)
  end
end
