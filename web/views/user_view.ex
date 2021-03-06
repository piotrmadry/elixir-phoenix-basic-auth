defmodule BaseAuthPhoenix.API.UserView do
  use BaseAuthPhoenix.Web, :view

  alias BaseAuthPhoenix.API.UserView

  def render("index.json", %{users: users}) do
    %{users: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{user: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      name: user.name,
      last_name: user.last_name
    }
  end
end
