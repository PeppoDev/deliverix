defmodule Deliverix.Factory do
  use ExMachina

  def user_params_factory() do
    %{
      age: 27,
      address: "St test",
      cep: "00000000",
      name: "John Due",
      email: "john.due@email.com",
      password: "12345678910",
      cpf: "12345678910"
    }
  end
end
