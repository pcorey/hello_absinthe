defmodule HelloAbsinthe.PageController do
  use HelloAbsinthe.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
