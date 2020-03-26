defmodule FunboxTestWeb.PageControllerTest do
  use FunboxTestWeb.ConnCase
  import FunboxTestWeb.StatusCodes

  test "POST /visited_links ok" do
    conn = build_conn()
    links = %{"links" => ["link1", "link2", "link3", "link3"]} 

    conn = post(conn, "/visited_links", links)
    assert json_response(conn, 200) == %{ "status" => ok() }
  end

  test "POST /visited_links error" do
    conn = build_conn()
    links = %{"links" => ["link3", 123, "link3"]} 

    conn = post(conn, "/visited_links", links)
    assert json_response(conn, 200) == %{ "status" => error() }
  end

  test "GET /visited_domains with params ok" do
    conn = build_conn()
    params = %{from: "1", to: "3"}

    conn = get(conn, "/visited_domains", params)
    assert json_response(conn, 200) == %{ 
      "domains" => [
        "somelink1",
        "somelink2",
        "somelink3"
      ],
      "status" => "ok" }
  end

  test "GET /visited_domains with params error" do
    conn = build_conn()
    params = %{"from" => "3"}
    assert_raise MatchError, fn ->
      conn = get(conn, "/visited_domains", params)
      assert json_response(conn, 200) == %{ "status" => params_error() }
    end
  end

end
