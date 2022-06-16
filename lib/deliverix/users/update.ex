defmodule Deliverix.Users.Update do
  alias Ecto.UUID
  alias Deliverix.{Repo, User, Error}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_fround_error()}
      %User{} = user -> merge_data(user, params)
    end
  end

  defp merge_data(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
