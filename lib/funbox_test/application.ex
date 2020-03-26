defmodule FunboxTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  use Supervisor

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      FunboxTestWeb.Endpoint,
      # Starts a worker by calling: FunboxTest.Worker.start_link(arg)
      # {FunboxTest.Worker, arg},
      {Redix, host: Application.fetch_env!(:funbox_test, :redis_host), 
        port: Application.fetch_env!(:funbox_test, :redis_port)|> String.to_integer(), name: :redix},
      # Check DB connection and populate test data
      worker(Task, [&FunboxTestWeb.TestData.populate/0], restart: :temporary) 
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FunboxTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FunboxTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
