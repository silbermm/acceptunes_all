# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :acceptunes_security, AcceptunesSecurity.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: {:system, "DATABASE_URL"}

config :acceptunes_web, ecto_repos: [AcceptunesWeb.Repo]

# Configures the endpoint
config :acceptunes_web, AcceptunesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "D95IuNCtFrnmJdOh8gLm13xAj7hD4/rMCdK5ydpdwzdzHQFHIf4rKpOwHSsPMg0Q",
  render_errors: [view: AcceptunesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AcceptunesWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Acceptunes",
  ttl: {30, :days},
  verify_issuer: true,
  secret_key: "asdfasdfasdfasdfasdf",
  serializer: AcceptunesWeb.GuardianSerializer,
  permissions: %{
    default: [
      :read_profile,
      :write_profile,
      :read_token,
      :revoke_token,
    ],
  }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
