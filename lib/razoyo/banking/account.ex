defmodule Razoyo.Banking.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :account_number, :string
    field :access_token, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:account_number, :access_token])
    |> validate_required([:account_number, :access_token])
  end
end
