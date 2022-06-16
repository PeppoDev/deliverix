defmodule Deliverix.Repo do
  use Ecto.Repo,
    otp_app: :deliverix,
    adapter: Ecto.Adapters.Postgres
end
