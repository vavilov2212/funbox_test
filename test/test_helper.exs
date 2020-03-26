ExUnit.start()

defmodule FunboxTestWeb.TestData do
  def populate do
    db_records = ["somelink1","somelink2","somelink3"] 
    {:ok, r_conn} = Redix.start_link()
    for n <- [1, 2, 3] do
      IO.inspect n
      db_records |> Enum.reverse() |> Enum.each(fn record -> 
        Redix.command(r_conn, ["LPUSH", "funbox_test.#{n}", record])
      end)
    end
    Redix.stop(r_conn)
  end

  def check_test_data do
    {:ok, r_conn} = Redix.start_link()
    {:ok, keys} = Redix.command(r_conn, ["KEYS", "funbox_test.*"])
    # IO.inspect Redix.command(r_conn, ["KEYS", "funbox_test.*"])
    for n <- keys, do: Redix.command(r_conn, ["DEL", n])
    populate()
    IO.inspect Redix.command(r_conn, ["KEYS", "funbox_test.*"])
    Redix.stop(r_conn)
  end
end

FunboxTestWeb.TestData.check_test_data()
