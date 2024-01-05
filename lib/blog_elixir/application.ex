defmodule BlogElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BlogElixirWeb.Telemetry,
      BlogElixir.Repo,
      {DNSCluster, query: Application.get_env(:blog_elixir, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BlogElixir.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BlogElixir.Finch},
      # Start a worker by calling: BlogElixir.Worker.start_link(arg)
      # {BlogElixir.Worker, arg},
      # Start to serve requests, typically the last entry
      BlogElixirWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BlogElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BlogElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
