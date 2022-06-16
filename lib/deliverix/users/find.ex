defmodule Deliverix.Users.Find do
  alias Ecto.UUID
  alias Deliverix.{Repo, User, Error}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_fround_error()}
      %User{} = user -> {:ok, user}
    end
  end
end
