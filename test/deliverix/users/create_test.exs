defmodule Deliverix.Users.CreateTest do
  use Deliverix.DataCase, async: true

  import Deliverix.Factory

  alias Deliverix.Error
  alias Deliverix.Users.Create
  alias Deliverix.User

  describe "call/2" do
    test "when all params are valid, return the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{}} = response
    end

    test "when there is an invalid param, return an error" do
      params = build(:user_params, %{age: 15})

      response = Create.call(params)

      {:error, %Error{result: changeset}} = response

      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) === expected_response
    end
  end
end
