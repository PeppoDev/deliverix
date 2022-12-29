defmodule Deliverix.Users.Find do
  alias Deliverix.{Repo, User, Error}

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_fround_error()}
      %User{} = user -> {:ok, user}
    end
  end
end
