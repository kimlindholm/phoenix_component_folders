defmodule PhoenixComponentFoldersWeb.PageControllerTest do
  use PhoenixComponentFoldersWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Latest comments"
  end
end
