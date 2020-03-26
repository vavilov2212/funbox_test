defmodule FunboxTestWeb.PageView do
  use FunboxTestWeb, :view

  def render("index.json", %{status: status}) do
    %{ status: status }
  end

  def render("domains.json", %{domains: domains, status: status }) do
    %{
      domains: domains, 
      status: status
    }
  end

end
