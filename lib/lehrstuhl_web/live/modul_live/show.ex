defmodule LehrstuhlWeb.ModulLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Klausuren

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:modul, Klausuren.get_modul!(id))}
  end

  defp page_title(:show), do: "Show Modul"
  defp page_title(:edit), do: "Edit Modul"
end
