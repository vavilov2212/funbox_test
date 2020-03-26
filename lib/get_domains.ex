defmodule FunboxTestWeb.GetDomains do

  def assert_from_is_greater(params) do
    to(params) > from(params)
  end

  def get_all_records(params) do
    {:ok, r_conn} = Redix.start_link()
    domains_list = Enum.reduce(from(params)..to(params), [], fn i, acc ->
      {:ok, domains} = Redix.command(r_conn, ["LRANGE", i, 0, -1])
      acc = acc ++ domains
    end)
    Redix.stop(r_conn)
    domains_list
  end

  def to(params) do
    [from | to] = Map.values(params)
    [to | _tail] = to
    if is_binary(to), do: String.to_integer(to), else: to
  end

  def from(params) do
    [from | to] = Map.values(params)
    if is_binary(from), do: String.to_integer(from), else: from
  end
end
