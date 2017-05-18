# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :green_monster,
  ecto_repos: [GreenMonster.Repo]

# Configures the endpoint
config :green_monster, GreenMonster.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SVwaght4ydlDR4G39vapeO7mRpW1ykMDUDtAy3oiV78Uk1Xdk1v2q/xpX5cxXowc",
  render_errors: [view: GreenMonster.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GreenMonster.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
    slim: PhoenixSlime.Engine,
    slime: PhoenixSlime.Engine

config :ueberauth, Ueberauth,
  providers: [
    auth0: {Ueberauth.Strategy.Auth0, []}
]

config :oauth2,
  warn_missing_serializer: false,
  serializers: %{
    "application/vnd.api+json" => Poison,
    "application/json" => Poison
  }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
