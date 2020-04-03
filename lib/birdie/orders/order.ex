defmodule Birdie.Orders.Order do
  use Birdie.Schema

  @derive {Jason.Encoder, only: [:first_name, :last_name, :pickup_time, :status, :total_cost]}
  schema "orders" do
    field :first_name, :string
    field :last_name, :string
    field :pickup_time, :utc_datetime
    field :status, :string
    field :total_cost, :integer

    has_many :order_items, Birdie.Orders.OrderItem

    timestamps()
  end

  def create_changeset(%__MODULE__{} = order, attrs \\ %{}) do
    order
    |> cast(attrs, [:first_name, :last_name, :pickup_time, :status])
  end
end
