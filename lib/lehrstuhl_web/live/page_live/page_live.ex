defmodule LehrstuhlWeb.PageLive do
  use LehrstuhlWeb, :live_view

  import Phoenix.Component, only: [live_component: 1]

  # Diese Zeile lädt den User aus der Session in den Socket
  on_mount {LehrstuhlWeb.UserAuth, :mount_current_user}

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
