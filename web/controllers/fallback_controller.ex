defmodule BaseAuthPhoenix.FallbackController do
  use BaseAuthPhoenix.Web, :controller

  alias BaseAuthPhoenix.API.ErrorView

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(ErrorView, "global_error.json", %{status: 404})
  end

  def call(conn, {:error, :no_content}) do
    conn
    |> put_status(:no_content)
    |> json(%{})
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(422)
    |> render(ErrorView, "changeset_error.json", changeset)
  end
end
