defmodule ElixirReleaseDatabaseWeb.PageController do
  use ElixirReleaseDatabaseWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
