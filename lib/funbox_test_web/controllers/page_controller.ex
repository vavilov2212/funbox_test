defmodule FunboxTestWeb.PageController do
  use FunboxTestWeb, :controller
  import FunboxTestWeb.PostLinks
  import FunboxTestWeb.GetDomains
  import FunboxTestWeb.StatusCodes

  def visited_links(conn, params) do
    time_key = DateTime.utc_now() |> DateTime.to_unix()
    params = trim_body(params)

    status = check_params(params)
    if "ok" == status, do: params |> Enum.map(&trim_uri/1) |> Enum.uniq() |> save_links(time_key)
    render(conn, "index.json", %{status: status})
  end

  def visited_domains(conn, params) do
    try do   
     %{"from" => _from, "to" => _to} = params
    rescue
      MatchError -> render(conn, "index.json", %{status: params_error()})
    end
    domains = get_all_records(params) |> Enum.uniq()
    render(conn, "domains.json", %{domains: domains, status: ok()})
  end

end
