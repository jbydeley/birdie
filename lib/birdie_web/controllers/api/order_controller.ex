defmodule BirdieWeb.API.OrderController do
  use BirdieWeb, :controller

  alias Birdie.Orders

  require Logger

  def index(conn, _params) do
    orders = Orders.list_orders()

    # conn = Enum.reduce(orders, conn, fn (order, acc) ->
    #   push(acc, Routes.order_path(conn, :show, order))
    # end)

    conn
    |> render("index.json", orders: orders)
  end

  def show(conn, %{"id" => id}) do
    order = Orders.find_order(id)

    order_items = Orders.list_order_items(id)

    conn
    |> render("show.json", order: order, order_items: order_items)
  end

  def create(conn, %{"name" => _} = params) do
    case Orders.create_order(params) do
      {:ok, order} ->
        conn
        |> put_status(:created)
        |> render("show.json", order: order)
      _ ->
        text(conn, "Failed")
    end
  end

  def update(conn, %{"id" => id} = params) do
    case Orders.update_order(id, params) do
      {:ok, order} ->
        conn
        |> put_status(:accepted)
        |> render("show.json", order: order)
      _ ->
        text(conn, "Failed")
    end
  end

  def delete(conn, %{"id" => id}) do
    case Orders.delete_order(id) do
      {:ok, order} ->
        Logger.info("order #{order.id} was deleted")
      _ ->
        Logger.error("Failed to delete '#{id}'")
    end

    conn
    |> put_status(:no_content)
    |> text("Delete successful")
  end
end
