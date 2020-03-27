defmodule FunboxTestWeb.ErrorViewTest do
  use FunboxTestWeb.ConnCase, async: true
  import FunboxTestWeb.ErrorView
  import FunboxTestWeb.StatusCodes 

  # Bring render/3 and render_to_string/3 for testing custom views
  # import Phoenix.View

  # test "renders 500.html" do
  #   assert render_to_string(FunboxTestWeb.ErrorView, "500.html", []) == "Internal Server Error"
  # end

  test "renders 404.json" do
    rendered_response = render("404.json", %{status() => page_not_found()})
    assert rendered_response == %{ status: page_not_found() }
  end
  test "renders 400.json" do
    rendered_response = render("400.json", %{status() => bad_request()})
    assert rendered_response == %{ status: bad_request() }
  end
  test "renders 500.json" do
    rendered_response = render("500.json", %{status() => interanl_error()})
    assert rendered_response == %{ status: bad_request() }
  end

  test "renders index.json error" do
    rendered_response = render("index.json", %{status() => error()})
    assert rendered_response == %{ status: error() }
  end
end
