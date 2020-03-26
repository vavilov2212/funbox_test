defmodule FunboxTestWeb.Router do
  use FunboxTestWeb, :router
  use Plug.ErrorHandler

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FunboxTestWeb do
    pipe_through :api

    post "/visited_links", PageController, :visited_links
    get "/visited_domains", PageController, :visited_domains
  end

  defp handle_errors(conn, something) do
    IO.inspect something
    FunboxTestWeb.ErrorView.render("", %{})
  end
  # Other scopes may use custom stacks.
  # scope "/api", FunboxTestWeb do
  #   pipe_through :api
  # end
end
