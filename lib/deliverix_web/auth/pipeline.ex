defmodule DeliverixWeb.Auth.Pipeline do
  @moduledoc """
  This module defines the pipeline for the API.
  """

  use Guardian.Plug.Pipeline, otp_app: :deliverix, module: DeliverixWeb.Auth.Guardian

  plug Guardian.Plug.VerifyHeader, scheme: "Bearer"
  # plug Guardian.Plug.EnsureAuthenticated, handler: DeliverixWeb.Auth.ErrorHandler
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
