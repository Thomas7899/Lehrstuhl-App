defmodule LehrstuhlWeb.AbstraktesSeminarLive.Show do
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
     |> assign(:abstraktes_seminar, Seminare.get_abstraktes_seminar!(id))
     |> assign(:seminare, Seminare.list_seminare_for_abstraktes_seminar(id))}
  end

  defp page_title(:show), do: "Show Abstraktes seminar"
  defp page_title(:edit), do: "Edit Abstraktes seminar"
end
