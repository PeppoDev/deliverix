# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :deliverix,
  ecto_repos: [Deliverix.Repo]

config :deliverix, Deliverix.Users.Create, via_cep_client: Deliverix.ViaCep.Client

config :deliverix, DeliverixWeb.Auth.Guardian,
  issuer: "deliverix",
  secret_key: "FgaJSHGVbre/gwnuycCalc2anPvpTYy7Ke/TPst+XfhmNG09baAZJyj0JiQTEmbg"

config :deliverix, Deliverix.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :deliverix, DeliverixWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: DeliverixWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Deliverix.PubSub,
  live_view: [signing_salt: "Qb+ZqelF"]

config :deliverix, DeliverixWeb.Auth.Pipeline,
  module: DeliverixWeb.Auth.Guardian,
  error_handler: DeliverixWeb.Auth.ErrorHandler

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :deliverix, Deliverix.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
