defmodule FunboxTestWeb.ErrorView do
  use FunboxTestWeb, :view
  import FunboxTestWeb.StatusCodes

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  def render("400.json", _assigns) do
    %{status: bad_request() }
  end

  def render("404.json", _assigns) do
    %{status: page_not_found()}
  end

  def render("500.json", _assigns) do
    %{status: bad_request()}
  end

  def render(_code, _assigns) do
    %{status: error()}
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
