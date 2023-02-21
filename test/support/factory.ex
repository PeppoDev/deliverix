defmodule Deliverix.Factory do
  alias Deliverix.User
  use ExMachina.Ecto, repo: Deliverix.Repo

  def user_params_factory() do
    %{
      "age" => 27,
      "address" => "St test",
      "cep" => "00000000",
      "name" => "John Due",
      "email" => "john.due@email.com",
      "password" => "12345678910",
      "cpf" => "12345678910"
    }
  end

  def user_factory() do
    %User{
      age: 27,
      address: "St test",
      cep: "00000000",
      name: "John Due",
      email: "john.due@email.com",
      password: "12345678910",
      cpf: "12345678910",
      id: "f23443d3-36b9-476b-97c9-1569019ebbfa"
    }
  end
end
