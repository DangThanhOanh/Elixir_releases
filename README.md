# ElixirReleaseDatabase

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


## Install releases
  export DATABASE_URL="ecto://postgres:root@localhost/elixir_release_database_dev"

  mix phx.gen.secret

  export SECRET_KEY_BASE="gEOOHR8pFfLAdTsgHjfeCboTCM+xlUgx7X+6TNo/p+FgcU190h2iiBvbVK06ZRco"  # "day ky tu khi thuc hien lenh mix phx.gen.secret"


  MIX_ENV=prod mix ecto.setup

  chmod a+x build.sh

  File prod.exs
    config :phoenix_hello, PhoenixHelloWeb.Endpoint,
      #url: [host: "example.com", port: 80], 
      url: [host: System.get_env("HOSTNAME") || "localhost", port: 80],
      cache_static_manifest: "priv/static/cache_manifest.json"

## Deploying to Render
  repo.ex
    use Ecto.Repo,
    otp_app: :elixir_release_database,
    adapter: Ecto.Adapters.Postgres,
    pool_size: 10

    def init(_type, config) do
      {:ok, Keyword.put(config, :url, System.get_env("DATABASE_URL"))}
    end

  prod.exs
    url: [host: System.get_env("RENDER_EXTERNAL_HOSTNAME") || "localhost", port: 80],