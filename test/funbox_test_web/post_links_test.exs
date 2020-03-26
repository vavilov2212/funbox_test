defmodule FunboxTestWeb.PostLinksTest do
  use FunboxTestWeb.ConnCase
  import FunboxTestWeb.PostLinks
  import FunboxTestWeb.StatusCodes

  test "get list of links from request body ok" do
    params = gen_req_body(true) 
    assert trim_body(params) == [
      "https://ya.ru",
      "https://ya.ru?q=123",
      "funbox.ru",
      "https://stackoverflow.com/questions/11828270/how-to-exit-the-vim-editor"
    ]
  end

  # test "get list of links from request body error" do
  #   params = %{
  #     "links" => [
  #       "https://ya.ru",
  #       "https://ya.ru?q=123",
  #       "funbox.ru",
  #       "https://stackoverflow.com/questions/11828270/how-to-exit-the-vim-editor"
  #     ]
  #   }

  #   assert trim_body(params)
  # end

  test "check that every link is a string ok" do
    params = gen_req_body(true)
    params = trim_body(params)
    assert check_params(params) == ok() 
  end

  test "check that every link is a string error" do
    params = gen_req_body(false)
    params = trim_body(params)
    assert check_params(params) == error() 
  end

  test "trim individual link ok" do
    params = gen_req_body(true)
    params = trim_body(params)
    params = params |> Enum.map(&trim_uri/1) |> Enum.uniq()
    assert params == ["ya.ru", "funbox.ru", "stackoverflow.com"]
  end

  test "save links to database and assert retrieved values are correct ok" do
    time_key = DateTime.utc_now() |> DateTime.to_unix()
    params = gen_req_body(true)
    params = trim_body(params)
    params = params |> Enum.map(&trim_uri/1) |> Enum.uniq()
    assert save_links(params, time_key) == :ok 
    assert retrieve_links("funbox_test." <> to_string(time_key)) == params 
  end

  def retrieve_links(time_key) do
    {:ok, r_conn} = Redix.start_link()
    {:ok, links} = Redix.command(r_conn, ["LRANGE", time_key, 0, -1])
    Redix.stop(r_conn)
    links
  end

  def gen_req_body(status) do
    if status, do: %{
      "links" => [
        "https://ya.ru",
        "https://ya.ru?q=123",
        "funbox.ru",
        "https://stackoverflow.com/questions/11828270/how-to-exit-the-vim-editor"
      ]
    }, else:
    %{      
      "links" => [
        "https://ya.ru",
        123,
        "funbox.ru",
        "https://stackoverflow.com/questions/11828270/how-to-exit-the-vim-editor"
      ]
    }
  end
end
