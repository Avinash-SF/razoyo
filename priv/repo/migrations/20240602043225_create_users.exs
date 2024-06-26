defmodule Razoyo.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :secret_key, :string, null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:users, [:secret_key])
  end
end
