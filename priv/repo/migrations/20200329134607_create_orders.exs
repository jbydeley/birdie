defmodule Birdie.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :first_name, :string
      add :last_name, :string
      add :pickup_time, :utc_datetime
      add :status, :string, default: "PENDING"

      add :total_cost, :integer

      add :entree_id, references(:entrees)
      add :protein_id, references(:proteins)

      timestamps()
    end

    create table(:order_items) do
      add :order_id, references(:orders)
      add :entree_id, references(:entrees)
      add :protein_id, references(:proteins)

      timestamps()
    end

    create table(:order_item_toppings) do
      add :order_item_id, references(:order_items, on_delete: :delete_all)
      add :topping_id, references(:toppings)

      timestamps()
    end

    create table(:order_item_sauces) do
      add :order_item_id, references(:order_items, on_delete: :delete_all)
      add :sauce_id, references(:sauces)

      timestamps()
    end
  end
end
