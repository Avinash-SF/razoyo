defmodule Razoyo.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :account_number, :string
      add :access_token, :string

      timestamps(type: :utc_datetime)
    end
  end
end
