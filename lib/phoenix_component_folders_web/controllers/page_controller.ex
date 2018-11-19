defmodule PhoenixComponentFoldersWeb.PageController do
  use PhoenixComponentFoldersWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", comments: example_comments())
  end

  defp example_comments do
    [%{author: "Jack", content: "Lorem ipsum"}, %{author: "Linda", content: "Dolor sit amet"}]
  end
end
