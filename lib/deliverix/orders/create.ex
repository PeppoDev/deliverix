defmodule Deliverix.Orders.Create do
  import Ecto.Query
  alias Deliverix.{Repo, Item, Order, Error}

  # TODO: create a changeset to validate input data
  def call(params) do
    with {:ok, [%Item{} | _tl] = items} <- fetch_items(params),
         {:ok, order} <- insert_order(items, params) do
      {:ok, order}
    else
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end

  defp fetch_items(%{"items" => items_params}) do
    ids = Enum.map(items_params, fn item -> item["id"] end)
    query = from item in Item, where: item.id in ^ids

    query
    |> Repo.all()
    |> validate_items(ids)
    |> multiply_items(items_params)
  end

  defp validate_items(items, items_id) do
    items_map = Map.new(items, fn item -> {item.id, item} end)

    is_valid =
      items_id
      |> Enum.map(fn id -> {id, Map.get(items_map, id)} end)
      |> Enum.any?(fn {_id, value} -> is_nil(value) end)
      |> Kernel.!()

    {is_valid, items_map}
  end

  defp multiply_items({true, items_map}, items_params) do
    items =
      Enum.reduce(items_params, [], fn %{"id" => id, "quantity" => quantity}, acc ->
        item = Map.get(items_map, id)
        acc ++ List.duplicate(item, quantity)
      end)

    {:ok, items}
  end

  defp multiply_items({false, _items_map}, _items_params), do: {:error, "Invalid items"}

  defp insert_order(items, params) do
    params
    |> Order.changeset(items)
    |> Repo.insert()
  end
end
