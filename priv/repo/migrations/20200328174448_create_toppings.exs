defmodule Birdie.Repo.Migrations.CreateToppings do
  use Ecto.Migration

  def change do
    create table(:toppings) do
      add :name, :string, null: false
      add :description, :string
      add :spice, :integer, default: 0
      add :cost, :integer, default: 0

      timestamps()
    end

    create unique_index(:toppings, [:name])
  end
end
