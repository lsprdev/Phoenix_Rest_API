defmodule PhoenixRestApiWeb.Router do
  use PhoenixRestApiWeb, :router
  use Plug.ErrorHandler

  import Plug.Conn

  defp handle_errors(conn, %{reason: %Phoenix.Router.NoRouteError{message: message}}) do
    conn |> json(%{errors: message}) |> halt()
  end

  defp handle_errors(conn, %{reason: %{message: message}}) do
    conn |> json(%{errors: message}) |> halt()
  end

  defp handle_errors(conn, %{reason: _reason}) do
    conn |> put_status(500) |> json(%{errors: "An unknown error occurred"})
    |> halt()
  end

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
    post "/accounts/sign_in", AccountController, :sign_in
    delete "/accounts", AccountController, :delete
  end
end
