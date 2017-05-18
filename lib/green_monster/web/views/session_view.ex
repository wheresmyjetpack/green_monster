defmodule GreenMonster.Web.SessionView do
  use GreenMonster.Web, :view

  def auth0_client_id do
    auth0_env[:client_id]
  end

  def auth0_domain do
    auth0_env[:domain]
  end

  def auth0_callback(conn) do
    url(conn) <> auth0_env[:callback]
  end

  defp auth0_env do
    Application.get_env(:ueberauth, Ueberauth.Strategy.Auth0.OAuth)
  end
end
