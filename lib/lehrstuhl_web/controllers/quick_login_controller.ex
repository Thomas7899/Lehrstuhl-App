defmodule LehrstuhlWeb.QuickLoginController do
  use LehrstuhlWeb, :controller

  alias Lehrstuhl.Accounts
  alias LehrstuhlWeb.UserAuth

  # One-Click Login für admin@example.com
  def admin(conn, _params) do
    case Accounts.get_user_by_email("admin@example.com") do
      nil ->
        conn
        |> put_flash(:error, "Admin-Account nicht gefunden. Bitte initialen Admin anlegen.")
        |> redirect(to: ~p"/users/register")

      user ->
        # kein remember_me nötig -> leeres Map
        UserAuth.log_in_user(conn, user, %{})
    end
  end
end
