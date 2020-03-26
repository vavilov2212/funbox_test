defmodule FunboxTestWeb.PageViewTest do
  use FunboxTestWeb.ConnCase, async: true
  import FunboxTestWeb.PageView
  import FunboxTestWeb.StatusCodes 

  test "index.json success" do

    rendered_response = render("index.json", %{status() => ok()})
    assert rendered_response == %{
      status: "ok"
    }
  end

  test "show.json error" do

    rendered_response = render("index.json", %{status() => error()})

    assert rendered_response == %{
      status: "error"
    }
  end

end
