defmodule DeliverixWeb.OrdersController do
  use DeliverixWeb, :controller
  alias Deliverix.Order

  action_fallback(DeliverixWeb.FallbackController)

  def create(conn, params) do
    Deliverix.create_order(params)

    with {:ok, %Order{} = order} <- Deliverix.create_order(params) do
      conn
      |> put_status(:created)
      |> render("create.json", order: order)
    end
  end
end
