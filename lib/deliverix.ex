defmodule Deliverix do
  alias Deliverix.Users.Create, as: UserCreate
  alias Deliverix.Users.Find, as: UserFind
  alias Deliverix.Users.Delete, as: UserDelete
  alias Deliverix.Users.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(id), to: UserFind, as: :by_id
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call

  alias Deliverix.Items.Create, as: ItemCreate

  defdelegate create_item(params), to: ItemCreate, as: :call

  alias Deliverix.Orders.Create, as: OrderCreate
  defdelegate create_order(params), to: OrderCreate, as: :call
end
