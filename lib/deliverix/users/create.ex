defmodule Deliverix.Users.Create do
  alias Deliverix.ViaCep.Client
  alias Deliverix.{Repo, User, Error}

  def call(params) do
    cep = Map.get(params, "cep")
    changeset = User.changeset(params)

    #  add cpf validation as a custom ecto changeset validation
    with {:ok, %User{}} <- User.build(changeset),
         {:ok, _cep_info} <- Client.get_cep_info(cep),
         {:ok, %User{} = user} <- Repo.insert(changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
