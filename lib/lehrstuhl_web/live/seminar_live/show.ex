defmodule LehrstuhlWeb.SeminarLive.Show do
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
     |> assign(:seminar, Seminare.get_seminar!(id))
     |> assign(:seminarergebnisse, Seminare.list_seminarergebnisse_for_seminar(id))}
  end

  defp page_title(:show), do: "Show Seminar"
  defp page_title(:edit), do: "Edit Seminar"
end
