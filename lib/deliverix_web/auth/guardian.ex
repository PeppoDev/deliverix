defmodule DeliverixWeb.Auth.Guardian do
  use Guardian, otp_app: :deliverix

  alias Deliverix.User
  alias Deliverix.Error
  alias Deliverix.Users.Find, as: UserFind

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(%{"sub" => id}) do
    user = UserFind.by_id(id)
    {:ok, user}
  end

  def authenticate(%{"id" => user_id, "password" => password}) do
    with {:ok, %User{password_hash: hash} = user} <- UserFind.by_id(user_id),
         true <- Pbkdf2.verify_pass(password, hash),
         {:ok, token, _claims} <- encode_and_sign(user) do
      {:ok, token}
    else
      false -> {:error, Error.build(:unauthorized, "Please verify your credentials")}
      error -> error
    end
  end

  def authenticate(_), do: Error.build(:unauthorized, "Please verify your credentials")
end
