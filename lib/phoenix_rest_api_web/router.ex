defmodule PhoenixRestApiWeb.Router do
  use PhoenixRestApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixRestApiWeb do
    pipe_through :api
    get "/", DefaultController, :index

    get "/users", UserController, :index
    put "/users", UserController, :edit
    post "/users", UserController, :create
    delete "/users", UserController, :delete

    get "/accounts", AccountController, :index
    put "/accounts", AccountController, :edit
    post "/accounts", AccountController, :create
    delete "/accounts", AccountController, :delete
  end
end
