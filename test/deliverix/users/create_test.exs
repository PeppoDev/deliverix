defmodule Deliverix.Users.CreateTest do
  use Deliverix.DataCase, async: true

  import Deliverix.Factory
  import Mox

  alias Deliverix.Error
  alias Deliverix.Users.Create
  alias Deliverix.User

  alias Deliverix.ViaCep.ClientMock

  describe "call/1" do
    test "when all params are valid, return the user" do
      expect(ClientMock, :get_cep_info, fn _cep ->
        {:ok,
         %{
           "bairro" => "Sé",
           "cep" => "01001-000",
           "complemento" => "lado ímpar",
           "ddd" => "11",
           "gia" => "1004",
           "ibge" => "3550308",
           "localidade" => "São Paulo",
           "logradouro" => "Praça da Sé",
           "siafi" => "7107",
           "uf" => "SP"
         }}
      end)

      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{}} = response
    end

    test "when there is an invalid param, return an error" do
      params = build(:user_params, %{"age" => 15})

      response = Create.call(params)

      {:error, %Error{result: changeset}} = response

      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert {:error, %Error{status: :bad_request, result: _changeset}} = response
      assert errors_on(changeset) === expected_response
    end
  end
end
