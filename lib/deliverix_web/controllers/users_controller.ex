defmodule DeliverixWeb.UsersController do
  use DeliverixWeb, :controller
  alias Deliverix.User

  action_fallback DeliverixWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Deliverix.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end

    Deliverix.create_user(params)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Deliverix.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Deliverix.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Deliverix.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> render("show.json", user: user)
    end
  end

  def options(conn, _params) do
    conn
    |> put_status(:ok)
    |> put_req_header("allow", "GET,DELETE,POST,PUT,OPTIONS")
  end
end
