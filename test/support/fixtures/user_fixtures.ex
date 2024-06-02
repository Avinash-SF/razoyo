defmodule Razoyo.UserFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Razoyo.User` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{

      })
      |> Razoyo.User.create_account()

    account
  end
end
