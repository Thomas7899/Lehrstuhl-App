defmodule LehrstuhlWeb.SeminarergebnisLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Seminare

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:seminarergebnis, Seminare.get_seminarergebnis!(id))}
  end

  defp page_title(:show), do: "Show Seminarergebnis"
  defp page_title(:edit), do: "Edit Seminarergebnis"
end
