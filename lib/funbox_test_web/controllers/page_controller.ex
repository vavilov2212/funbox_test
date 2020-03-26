defmodule FunboxTestWeb.PageController do
  use FunboxTestWeb, :controller
  import FunboxTestWeb.PostLinks
  import FunboxTestWeb.GetDomains
  import FunboxTestWeb.StatusCodes

  def visited_links(conn, params) do
    IO.inspect "visited_links 1 line"
    time_key = DateTime.utc_now() |> DateTime.to_unix()
    IO.inspect time_key
    params = trim_body(params)
    IO.inspect params

    status = check_params(params)
    if "ok" == status do
      params = params |> Enum.map(&trim_uri/1) |> Enum.uniq() |> save_links(time_key)
      # IO.inspect "retrieve_links"
      # IO.inspect retrieve_links(time_key)
    end
    render(conn, "index.json", %{status: status})
  end

  def visited_domains(conn, params) do
    IO.inspect "visited_domains 1 line"
    IO.inspect params
    if params |> assert_from_is_greater() do
      domains = get_all_records(params) |> Enum.uniq()
      IO.inspect to_string(domains)
      render(conn, "domains.json", %{domains: domains, status: ok()})
    else
      render(conn, "index.json", %{status: params_error()})
    end
  end

end
