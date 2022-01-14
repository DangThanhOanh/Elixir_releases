import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :elixir_release_database, ElixirReleaseDatabase.Repo,
  username: "postgres",
  password: "root",
  database: "elixir_release_database_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_release_database, ElixirReleaseDatabaseWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "y9ocHua0nRNJ4mSOSxakSd8IIV/2QODy/dfx4YhpdlAbuDdrVTi/Wn+c8j2lL8j2",
  server: false

# In test we don't send emails.
config :elixir_release_database, ElixirReleaseDatabase.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
