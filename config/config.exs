# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config
# import_config "#{Mix.env}.secret.exs"

# Configures the endpoint
config :funbox_test, FunboxTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HXPdkP1d8c3dIlPkccA0rSFJao7bp4I+XAO+kY84tj/fpS5536CssQhtbPy7r2ig",
  render_errors: [view: FunboxTestWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: FunboxTest.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "yv0Grs+e"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
import_config "dev.secret.exs"
