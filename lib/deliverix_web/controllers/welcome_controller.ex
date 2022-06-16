defmodule DeliverixWeb.WelcomeController do
  use DeliverixWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("Welcome!")
  end
end
