defmodule Razoyo.User.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :secret_key, :string

    timestamps(type: :utc_datetime)
  end

  @required ~w(secret_key)a

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, @required)
    |> validate_required(@required)
  end
end
