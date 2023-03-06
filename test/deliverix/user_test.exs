defmodule Deliverix.UserTest do
  use Deliverix.DataCase, async: true

  import Deliverix.Factory

  alias Ecto.Changeset
  alias Deliverix.User

  describe "changeset/2" do
    test "when all params are valid, return a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{}, valid?: true} = response
    end

    test "when updaing a changeset, return a valid changeset with the changes" do
      params = build(:user_params)

      params_to_update = %{age: 18, name: "Test Name"}

      response =
        params
        |> User.changeset()
        |> User.changeset(params_to_update)

      assert %Changeset{changes: %{name: "Test Name", age: 18}, valid?: true} = response
    end

    test "when there are some errors, returns an invalid changeset" do
      params = build(:user_params, %{"age" => 15, "password" => "123456"})

      response = User.changeset(params)
      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert errors_on(response) == expected_response
    end
  end
end
