defmodule Birdie.Repo.Migrations.CreateSauces do
  use Ecto.Migration

  def change do
    create table(:sauces) do
      add :name, :string, null: false
      add :spice, :integer, default: 0

      timestamps()
    end

    create unique_index(:sauces, [:name])
  end
end
