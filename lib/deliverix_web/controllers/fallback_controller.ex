defmodule DeliverixWeb.FallbackController do
  use DeliverixWeb, :controller

  alias Deliverix.Error

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(DeliverixWeb.ErrorView)
    |> render("error.json", result: result)
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(DeliverixWeb.ErrorView)
    |> render("error.json", result: result)
  end
end
