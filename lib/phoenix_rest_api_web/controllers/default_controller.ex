defmodule PhoenixRestApiWeb.DefaultController do
  use PhoenixRestApiWeb, :controller

  def index(conn, _params) do
    capitalized_env = String.capitalize(to_string(Mix.env()))
    text(conn, "Welcome to Phoenix! - #{capitalized_env}")
  end
end
