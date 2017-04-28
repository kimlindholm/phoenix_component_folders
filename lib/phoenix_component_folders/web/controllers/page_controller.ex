defmodule PhoenixComponentFolders.Web.PageController do
  use PhoenixComponentFolders.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
