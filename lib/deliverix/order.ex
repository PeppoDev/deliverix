defmodule Deliverix.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Enum
  alias Deliverix.User
  alias Deliverix.Item

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:address, :payment_method, :user_id]
  @payment_method [:money, :credit_card, :debit_card]

  @derive {Jason.Encoder, only: @required_params ++ [:id, :items]}

  schema "orders" do
    field :payment_method, Enum, values: @payment_method
    field :comments, :string
    field :address, :string

    many_to_many(:items, Item, join_through: "orders_items")
    belongs_to(:user, User)
    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params, [%Item{} | _tails] = items) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> put_assoc(:items, items)
    |> validate_length(:comments, min: 6)
    |> validate_length(:address, min: 10)
  end
end
