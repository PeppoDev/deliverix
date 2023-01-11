defmodule DeliverixWeb.ItemsController do
  use DeliverixWeb, :controller
  alias Deliverix.Item

  action_fallback(DeliverixWeb.FallbackController)

  def create(conn, params) do
    with {:ok, %Item{} = item} <- Deliverix.create_item(params) do
      conn
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end
end
