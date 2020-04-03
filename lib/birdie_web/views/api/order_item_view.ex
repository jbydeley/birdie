defmodule BirdieWeb.API.OrderItemView do
  use BirdieWeb, :view

  def render("index.json", %{order_id: order_id, order_items: order_items}) do
    %{
      "actions" => [%{
        "name" => "Create order",
        "method" => "POST",
        "href" => Routes.order_order_item_url(BirdieWeb.Endpoint, :create, order_id),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text",
          "required" => true,
        }]
      }],
      "class" => "order_items",
      "entities" => render_many(order_items, __MODULE__, "order-item-link.json"),
      "links" => [%{
        "self" => Routes.order_order_item_url(BirdieWeb.Endpoint, :index, order_id)
      }]
    }
  end

  def render("order-item-link.json", %{order_item: order_item}) do
    %{
      "class" => "order_item",
      "href" => Routes.order_order_item_url(BirdieWeb.Endpoint, :show, order_item.order_id, order_item)
    }
  end

  def render("show.json", %{order_item: order_item}) do
    %{
      "actions" => [%{
        "name" => "Delete Order Item",
        "method" => "DELETE",
        "href" => Routes.order_order_item_url(BirdieWeb.Endpoint, :delete, order_item.order_id, order_item)
      }, %{
        "name" => "Update Order Item",
        "method" => "PUT",
        "href" => Routes.order_order_item_url(BirdieWeb.Endpoint, :update, order_item.order_id, order_item),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text"
        }]
      }],
      "class" => "order_item",
      "entities" => [
        BirdieWeb.API.EntreeView.render("entree-link.json", entree: order_item.entree_id),
        BirdieWeb.API.ProteinView.render("protein-link.json", protein: order_item.protein_id),
        %{
          "class" => "toppings",
          "rel" => "items",
          "href" => Routes.order_order_item_topping_url(BirdieWeb.Endpoint, :index, order_item.order_id, order_item)
        }
        # BirdieWeb.API.ToppingView.render("topping-link.json", topping: order_item.topping_id),
        # BirdieWeb.API.SauceView.render("sauce-link.json", sauce: order_item.sauce_id),
      ],
      "links" => [%{
        "class" => "order_item",
        "rel" => "self",
        "href" => Routes.order_order_item_url(BirdieWeb.Endpoint, :show, order_item.order_id, order_item)
      }, %{
        "class" => "order_items",
        "rel" => "parent",
        "href" => Routes.order_order_item_url(BirdieWeb.Endpoint, :index, order_item.order_id)
      }]
    }
  end
end
