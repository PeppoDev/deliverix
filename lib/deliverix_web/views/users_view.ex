defmodule DeliverixWeb.UsersView do
  use DeliverixWeb, :view

  alias Deliverix.User

  def render("create.json", %{user: %User{} = user, token: token}) do
    %{
      message: "User created",
      user: user,
      token: token
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}

  #  move to a dedicated view
  def render("login.json", %{token: token}), do: %{token: token}
end
