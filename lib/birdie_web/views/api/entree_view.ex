defmodule BirdieWeb.API.EntreeView do
  use BirdieWeb, :view


  def render("index.json", %{entrees: entrees}) do
    %{
      "actions" => [%{
        "name" => "Create Entree",
        "method" => "POST",
        "href" => Routes.entree_url(BirdieWeb.Endpoint, :create),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text",
          "required" => true,
        }]
      }],
      "class" => "entrees",
      "entities" => render_many(entrees, __MODULE__, "entree-link.json")
    }
  end

  def render("entree-link.json", %{entree: entree}) do
    %{
      "class" => "entree",
      "href" => Routes.entree_url(BirdieWeb.Endpoint, :show, entree)
    }
  end

  def render("show.json", %{entree: entree}) do
    %{
      "actions" => [%{
        "name" => "Delete Entree",
        "method" => "DELETE",
        "href" => Routes.entree_url(BirdieWeb.Endpoint, :delete, entree)
      }, %{
        "name" => "Update entree",
        "method" => "PUT",
        "href" => Routes.entree_url(BirdieWeb.Endpoint, :update, entree),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text"
        }]
      }],
      "class" => "entree",
      "properties" => entree,
      "links" => [%{
        "class" => "entree",
        "rel" => "self",
        "href" => Routes.entree_url(BirdieWeb.Endpoint, :show, entree)
      }, %{
        "class" => "entrees",
        "rel" => "parent",
        "href" => Routes.entree_url(BirdieWeb.Endpoint, :index)
      }]
    }
  end
end
