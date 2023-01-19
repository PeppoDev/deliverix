defmodule DeliverixWeb.OrdersView do
  use DeliverixWeb, :view

  alias Deliverix.Order

  def render("create.json", %{order: %Order{} = order}) do
    %{
      message: "order created",
      order: order
    }
  end
end
