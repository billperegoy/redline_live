defmodule RedlineLiveWeb.PageLiveTest do
  use RedlineLiveWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, _page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Redline the Whites"
  end
end
