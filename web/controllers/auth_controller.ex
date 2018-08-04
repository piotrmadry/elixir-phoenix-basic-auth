defmodule BaseAuthPhoenix.AuthController do
  use BaseAuthPhoenix.Web, :controller

  alias BaseAuthPhoenix.Authorization
  alias BaseAuthPhoenix.AuthView

  def authorize_user(conn, _params) do
    with {:ok, body, conn} <- read_body(conn),
         {:ok, credentials} <- Poison.decode(body) |> IO.inspect(),
         {:ok, tokens} <- Authorization.generate_token(credentials) do
      conn
      |> put_status(200)
      |> render(AuthView, "auth_tokens.json", auth_tokens: tokens)
    else
      {:error, :wrong_credentials} ->
        conn
        |> put_status(422)
        |> json(%{"message" => "dupa"})
    end
  end
end
