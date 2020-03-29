defmodule Birdie.Repo.Migrations.CreateEntrees do
  use Ecto.Migration

  def change do
    create table(:entrees) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:entrees, [:name])
  end
end
