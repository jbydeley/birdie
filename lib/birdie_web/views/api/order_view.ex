defmodule BirdieWeb.API.OrderView do
  use BirdieWeb, :view

  def render("index.json", %{orders: orders}) do
    %{
      "actions" => [%{
        "name" => "Create order",
        "method" => "POST",
        "href" => Routes.order_url(BirdieWeb.Endpoint, :create),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text",
          "required" => true,
        }]
      }],
      "class" => "orders",
      "entities" => render_many(orders, __MODULE__, "order-link.json"),
      "links" => [%{
        "self" => Routes.order_url(BirdieWeb.Endpoint, :index)
      }]
    }
  end

  def render("order-link.json", %{order: order}) do
    %{
      "class" => "order",
      "href" => Routes.order_url(BirdieWeb.Endpoint, :show, order)
    }
  end

  def render("show.json", %{order: order, order_items: order_items}) do
    %{
      "actions" => [%{
        "name" => "Delete Order",
        "method" => "DELETE",
        "href" => Routes.order_url(BirdieWeb.Endpoint, :delete, order)
      }, %{
        "name" => "Update Order",
        "method" => "PUT",
        "href" => Routes.order_url(BirdieWeb.Endpoint, :update, order),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text"
        }]
      }],
      "entities" => render_many(order_items, BirdieWeb.API.OrderItemView, "order-item-link.json"),
      "class" => "order",
      "properties" => order,
      "links" => [%{
        "class" => "order",
        "rel" => "self",
        "href" => Routes.order_url(BirdieWeb.Endpoint, :show, order)
      }, %{
        "class" => "orders",
        "rel" => "parent",
        "href" => Routes.order_url(BirdieWeb.Endpoint, :index)
      }, %{
        "class" => "order_items",
        "rel" => "items",
        "href" => Routes.order_order_item_url(BirdieWeb.Endpoint, :index, order)
      }]
    }
  end
end
