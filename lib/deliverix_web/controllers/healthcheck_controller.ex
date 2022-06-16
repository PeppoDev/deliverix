defmodule DeliverixWeb.HealthCheckController do
  use DeliverixWeb, :controller

  def head(conn, _params) do
    conn
    |> put_status(:no_content)
  end
end
