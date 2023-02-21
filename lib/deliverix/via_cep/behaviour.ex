defmodule Deliverix.ViaCep.Behaviour do
  alias Deliverix.Error

  @callback get_cep_info(String.t()) :: {:ok, map()} | {:error, Error.t()}
end
