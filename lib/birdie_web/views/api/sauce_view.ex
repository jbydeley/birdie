defmodule BirdieWeb.API.SauceView do
  use BirdieWeb, :view


  def render("index.json", %{sauces: sauces}) do
    %{
      "actions" => [%{
        "name" => "Create Sauce",
        "method" => "POST",
        "href" => Routes.sauce_url(BirdieWeb.Endpoint, :create),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text",
          "required" => true,
        }, %{
          "name" => "spice",
          "type" => "text"
        }]
      }],
      "class" => "sauces",
      "entities" => render_many(sauces, __MODULE__, "sauce-link.json")
    }
  end

  def render("sauce-link.json", %{sauce: sauce}) do
    %{
      "class" => "sauce",
      "href" => Routes.sauce_url(BirdieWeb.Endpoint, :show, sauce)
    }
  end

  def render("show.json", %{sauce: sauce}) do
    %{
      "actions" => [%{
        "name" => "Delete Sauce",
        "method" => "DELETE",
        "href" => Routes.sauce_url(BirdieWeb.Endpoint, :delete, sauce)
      }, %{
        "name" => "Update sauce",
        "method" => "PUT",
        "href" => Routes.sauce_url(BirdieWeb.Endpoint, :update, sauce),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text"
        }, %{
          "name" => "spice",
          "type" => "text"
        }]
      }],
      "class" => "sauce",
      "properties" => sauce,
      "links" => [%{
        "class" => "sauce",
        "rel" => "self",
        "href" => Routes.sauce_url(BirdieWeb.Endpoint, :show, sauce)
      }, %{
        "class" => "sauces",
        "rel" => "parent",
        "href" => Routes.sauce_url(BirdieWeb.Endpoint, :index)
      }]
    }
  end
end
