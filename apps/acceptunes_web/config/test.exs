use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :acceptunes_web, AcceptunesWeb.Endpoint,
  http: [port: 4001],
  server: true

config :acceptunes_web, AcceptunesWeb.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "acceptunes_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :acceptunes_web, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn
