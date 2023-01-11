defmodule DeliverixWeb.ItemsView do
  use DeliverixWeb, :view

  alias Deliverix.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "item created",
      item: item
    }
  end
end
