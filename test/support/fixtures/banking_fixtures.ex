defmodule Razoyo.BankingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Razoyo.Banking` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{

      })
      |> Razoyo.Banking.create_account()

    account
  end
end
