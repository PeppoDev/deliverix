defmodule DeliverixWeb.UsersViewTest do
  use DeliverixWeb.ConnCase, async: true

  import Deliverix.Factory
  import Phoenix.View

  alias Deliverix.User
  alias DeliverixWeb.UsersView

  test "render create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{message: "User created", user: %User{}} = response
  end
end
