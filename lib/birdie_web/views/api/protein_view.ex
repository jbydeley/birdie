defmodule BirdieWeb.API.ProteinView do
  use BirdieWeb, :view


  def render("index.json", %{proteins: proteins}) do
    %{
      "actions" => [%{
        "name" => "Create Protein",
        "method" => "POST",
        "href" => Routes.protein_url(BirdieWeb.Endpoint, :create),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text",
          "required" => true,
        }]
      }],
      "class" => "proteins",
      "entities" => render_many(proteins, __MODULE__, "protein-link.json")
    }
  end

  def render("protein-link.json", %{protein: protein}) do
    %{
      "class" => "protein",
      "href" => Routes.protein_url(BirdieWeb.Endpoint, :show, protein)
    }
  end

  def render("show.json", %{protein: protein}) do
    %{
      "actions" => [%{
        "name" => "Delete Protein",
        "method" => "DELETE",
        "href" => Routes.protein_url(BirdieWeb.Endpoint, :delete, protein)
      }, %{
        "name" => "Update protein",
        "method" => "PUT",
        "href" => Routes.protein_url(BirdieWeb.Endpoint, :update, protein),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text"
        }]
      }],
      "class" => "protein",
      "properties" => protein,
      "links" => [%{
        "class" => "protein",
        "rel" => "self",
        "href" => Routes.protein_url(BirdieWeb.Endpoint, :show, protein)
      }, %{
        "class" => "proteins",
        "rel" => "parent",
        "href" => Routes.protein_url(BirdieWeb.Endpoint, :index)
      }]
    }
  end
end
