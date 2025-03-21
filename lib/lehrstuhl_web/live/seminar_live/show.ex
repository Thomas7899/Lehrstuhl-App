defmodule LehrstuhlWeb.SeminarLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Seminare

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    seminar = Seminare.get_seminar!(id)
    seminarergebnisse = Seminare.get_seminarergebnisse_for_seminar(id)  # Funktion für die Seminarergebnisse

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:seminar, seminar)
     |> assign(:seminarergebnisse, seminarergebnisse)}  # Füge die Seminarergebnisse zu den assigns hinzu
  end

  defp page_title(:show), do: "Show Seminar"
  defp page_title(:edit), do: "Edit Seminar"
end
