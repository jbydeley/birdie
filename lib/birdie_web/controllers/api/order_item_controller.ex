defmodule BirdieWeb.API.OrderItemController do
  use BirdieWeb, :controller

  alias Birdie.Orders

  require Logger

  def index(conn, %{"order_id" => order_id}) do
    order_items = Orders.list_order_items(order_id)

    # conn = Enum.reduce(order_items, conn, fn (order, acc) ->
    #   push(acc, Routes.order_path(conn, :show, order))
    # end)

    conn
    |> render("index.json", order_id: order_id, order_items: order_items)
  end

  def show(conn, %{"order_id" => _order_id, "id" => id}) do
    order_item = Orders.find_order_item(id)

    conn
    |> render("show.json", order_item: order_item)
  end

  def create(conn, %{"name" => _} = params) do
    case Orders.create_order_item(params) do
      {:ok, order_item} ->
        conn
        |> put_status(:created)
        |> render("show.json", order_item: order_item)
      _ ->
        text(conn, "Failed")
    end
  end

  def update(conn, %{"id" => id} = params) do
    case Orders.update_order_item(id, params) do
      {:ok, order_item} ->
        conn
        |> put_status(:accepted)
        |> render("show.json", order_item: order_item)
      _ ->
        text(conn, "Failed")
    end
  end
  def delete(conn, %{"id" => id}) do
    case Orders.delete_order_item(id) do
      {:ok, order_item} ->
        Logger.info("order_item #{order_item.id} was deleted")
      _ ->
        Logger.error("Failed to delete '#{id}'")
    end

    conn
    |> put_status(:no_content)
    |> text("Delete successful")
  end
end
