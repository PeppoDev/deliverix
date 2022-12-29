defmodule DeliverixWeb.UsersControllerTest do
  use DeliverixWeb.ConnCase, async: true

  import Deliverix.Factory

  alias Ecto.Changeset
  alias Deliverix.User

  describe "create/2" do
    test "when all params are valid, creates a user", %{conn: conn} do
      params = %{
        "age" => 27,
        "address" => "St test",
        "cep" => "00000000",
        "name" => "John Due",
        "email" => "john.due@email.com",
        "password" => "12345678910",
        "cpf" => "12186399466"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert response == "banna"
    end
  end
end
