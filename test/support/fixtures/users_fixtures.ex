defmodule PhoenixRestApi.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixRestApi.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        biography: "some biography",
        full_name: "some full_name",
        gender: "some gender"
      })
      |> PhoenixRestApi.Users.create_user()

    user
  end
end
