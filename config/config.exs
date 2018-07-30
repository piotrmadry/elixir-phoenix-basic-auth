# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :base_auth_phoenix,
  ecto_repos: [BaseAuthPhoenix.Repo]

# Configures the endpoint
config :base_auth_phoenix, BaseAuthPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JPiKkP0b5N0mVzVM19gu9IchDlUP3P8ZYXOBf4P7WhHGEWY2gqbkdj5P/mLMDZjE",
  render_errors: [view: BaseAuthPhoenix.ErrorView, accepts: ~w(json)],
  pubsub: [name: BaseAuthPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
