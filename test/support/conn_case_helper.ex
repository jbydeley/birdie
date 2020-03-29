defmodule BirdieWeb.ConnCaseHelper do
  def render_json(view, template, assigns) do
    view.render(template, assigns)
    |> format_json
  end

  def format_json(data) do
    data
    |> Jason.encode!()
    |> Jason.decode!()
  end
end
