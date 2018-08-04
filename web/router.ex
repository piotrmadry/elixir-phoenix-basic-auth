defmodule BaseAuthPhoenix.Router do
  use BaseAuthPhoenix.Web, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api/v1", BaseAuthPhoenix do
    pipe_through(:api)
    post("/register", UserController, :register)
    post("/authorize", AuthController, :authorize_user)
    get("/users", UserController, :index)
  end
end
