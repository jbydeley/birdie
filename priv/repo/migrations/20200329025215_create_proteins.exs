defmodule Birdie.Repo.Migrations.CreateProteins do
  use Ecto.Migration

  def change do
    create table(:proteins) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:proteins, [:name])
  end
end
