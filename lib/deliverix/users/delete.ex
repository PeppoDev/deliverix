defmodule Deliverix.Users.Delete do
  alias Deliverix.{Repo, User, Error}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_fround_error()}
      %User{} = user -> Repo.delete(user)
    end
  end
end
