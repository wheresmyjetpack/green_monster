defmodule GreenMonster.Web.SessionController do
  use GreenMonster.Web, :controller
  plug Ueberauth

  def request(conn, _params) do
    render(conn, "login.html", callback_url: Ueberauth.Strategy.Helpers.callback_url(conn))
  end

  def callback(%Plug.Conn{assigns: %{ueberauth_failure: fails}} = conn, _params) do
    conn
    |> put_flash(:error, hd(fails.errors).message)
    |> render("login.html", callback_url: Ueberauth.Strategy.Helpers.callback_url(conn))
  end

  def callback(%Plug.Conn{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    token = auth |> Map.get(:credentials) |> Map.get(:other) |> Map.get("id_token")
    conn
      |> put_session(:current_user, auth)
      |> put_session(:jwt_token, token)
      |> redirect(to: page_path(conn, :index))
  end
end
