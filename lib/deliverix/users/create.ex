defmodule Deliverix.Users.Create do
  alias Deliverix.{Repo, User, Error}

  def call(params) do
    cep = Map.get(params, "cep")
    changeset = User.changeset(params)

    #  add cpf validation as a custom ecto changeset validation
    with {:ok, %User{}} <- User.build(changeset),
         {:ok, _cep_info} <- client().get_cep_info(cep),
         {:ok, %User{} = user} <- Repo.insert(changeset) do
      {:ok, user}
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end

  defp client do
    Application.fetch_env!(:deliverix, __MODULE__)[:via_cep_client]
  end
end
