defmodule BaseAuthPhoenix.AuthController do
  use BaseAuthPhoenix.Web, :controller

  alias BaseAuthPhoenix.Authorization.AuthService
  alias BaseAuthPhoenix.API.AuthView

  def authorize_user(conn, params) do
    with {:ok, tokens} <- AuthService.generate_token(params) do
      conn
      |> put_status(200)
      |> render(AuthView, "auth_tokens.json", auth_tokens: tokens)
    else
      {:error, :wrong_credentials} ->
        conn
        |> put_status(422)
        |> render(AuthView, "wrong_credentials.json")

      {:error, :missing_credentials} ->
        conn
        |> put_status(422)
        |> render(AuthView, "missing_credentials.json")
    end
  end
end
