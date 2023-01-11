defmodule DeliverixWeb.UsersControllerTest do
  use DeliverixWeb.ConnCase, async: true

  import Deliverix.Factory

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

      assert %{
               "message" => "User created",
               "user" => %{
                 "address" => "St test",
                 "age" => 27,
                 "cpf" => "12186399466",
                 "email" => "john.due@email.com",
                 "id" => _id
               }
             } = response
    end

    test "when there is an error, returns it", %{conn: conn} do
      params = %{}

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"],
          "name" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when the user were find by given id, delete it", %{conn: conn} do
      id = "f23443d3-36b9-476b-97c9-1569019ebbfa"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
