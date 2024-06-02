defmodule Razoyo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RazoyoWeb.Telemetry,
      Razoyo.Repo,
      {DNSCluster, query: Application.get_env(:razoyo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Razoyo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Razoyo.Finch},
      # Start a worker by calling: Razoyo.Worker.start_link(arg)
      # {Razoyo.Worker, arg},
      # Start to serve requests, typically the last entry
      RazoyoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Razoyo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RazoyoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
