defmodule LehrstuhlWeb.ErgebnisseAbschlussarbeitenLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    ergebnisse_abschlussarbeiten = Abschlussarbeiten.get_ergebnisse_abschlussarbeiten!(id)

    info_message =
      if ergebnisse_abschlussarbeiten.versuche < 3 do
        "Student has remaining attempts."
      else
        "No more attempts allowed."
      end

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:ergebnisse_abschlussarbeiten, ergebnisse_abschlussarbeiten)
     |> assign(:info_message, info_message)}
  end

  defp page_title(:show), do: "Show Ergebnisse Abschlussarbeiten"
  defp page_title(:edit), do: "Edit Ergebnisse Abschlussarbeiten"
end
