defmodule DeliverixWeb.Auth.ErrorHandler do
  alias Plug.Conn
  alias Guardian.Plug.ErrorHandler

  @behaviour ErrorHandler

  def auth_error(conn, {type, _reason}, _opts) do
    body = Jason.encode!(%{message: to_string(type)})

    Conn.send_resp(conn, :unauthorized, body)
  end
end
