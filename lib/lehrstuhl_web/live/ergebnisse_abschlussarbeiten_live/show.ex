defmodule LehrstuhlWeb.ErgebnisseAbschlussarbeitenLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:ergebnisse_abschlussarbeiten, Abschlussarbeiten.get_ergebnisse_abschlussarbeiten!(id))}
  end

  defp page_title(:show), do: "Show Ergebnisse abschlussarbeiten"
  defp page_title(:edit), do: "Edit Ergebnisse abschlussarbeiten"
end
