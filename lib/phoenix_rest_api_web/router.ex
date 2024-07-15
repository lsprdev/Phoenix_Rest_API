defmodule PhoenixRestApiWeb.Router do
  use PhoenixRestApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixRestApiWeb do
    pipe_through :api
    get "/", DefaultController, :index
  end
end
