defmodule FunboxTestWeb.StatusCodes do
  def ok(), do: "ok"
  def error(), do: "error"
  def status(), do: :status
  def bad_request(), do: "Bad request" 
  def page_not_found(), do: "Page not found"
  def interanl_error(), do: "Server internal error"
  def params_error(), do: "error. GET parameter 'from' is greater then 'to'"
end
