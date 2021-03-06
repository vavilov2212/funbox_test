defmodule FunboxTestWeb.PostLinks do
  import FunboxTestWeb.StatusCodes

  def check_params(params) do
    Enum.reduce_while(params, [], fn param, acc ->
      if false == is_binary(param), do: {:halt, :break}, else: {:cont, [param | acc]}
    end)
    |> case do
      :break -> error()
      _params -> ok() 
    end
  end

  def trim_uri(param) do
    uri = URI.parse(param)
    cond do
      uri.host == nil -> uri.path
      true -> uri.host
    end
  end

  def trim_body(params) do
    {_title, list} = List.first(Map.to_list(params))
    list
  end

  def save_links(params, time_key) do
    {:ok, r_conn} = Redix.start_link()
    params |> Enum.reverse() |> Enum.each(fn param -> Redix.command(r_conn, ["LPUSH", "funbox_test." <> to_string(time_key), param]) end)
    # Redix.command!(r_conn, ["SET", time_key, params])
    Redix.stop(r_conn)
  end

end
