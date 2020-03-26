defmodule FunboxTestWeb.ErrorView do
  use FunboxTestWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  def render("400.json", _assigns) do
    %{"status": "Bad request"}
  end

  def render("404.json", _assigns) do
    %{"status": "Page not found"}
  end

  def render("500.json", _assigns) do
    %{"status": "Server internal error"}
  end

  def render(code, assigns) do
    %{"status": "error"}
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
