defmodule BaseAuthPhoenix.API.AuthView do
  use BaseAuthPhoenix.Web, :view

  def render("auth_tokens.json", %{auth_tokens: auth_tokens}) do
    %{
      user_id: auth_tokens.user_id,
      token: auth_tokens.token,
      refresh_token: auth_tokens.refresh_token,
      expires_in: auth_tokens.expires_in
    }
  end

  def render("wrong_credentials.json", _assings) do
    %{
      code: 421,
      message: "Email or password is incorrect"
    }
  end

  def render("missing_credentials.json", _assings) do
    %{
      code: 421,
      message: "Email or password is missing"
    }
  end
end
