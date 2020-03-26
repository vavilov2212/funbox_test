defmodule FunboxTestWeb.TestData do
  def populate do
    db_records = ["somelink1","somelink2","somelink3"] 
    {:ok, r_conn} = Redix.start_link()
    for n <- [1, 2, 3], do: db_records |> Enum.reverse() |> Enum.each(fn record -> Redix.command(r_conn, ["LPUSH", n, record]) end)
    Redix.stop(r_conn)
  end
end
