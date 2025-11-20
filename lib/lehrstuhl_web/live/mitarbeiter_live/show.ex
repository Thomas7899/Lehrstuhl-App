defmodule LehrstuhlWeb.MitarbeiterLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Persons

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:mitarbeiter, Persons.get_mitarbeiter!(id))}
  end

  defp page_title(:show), do: "Show Mitarbeiter"
  defp page_title(:edit), do: "Edit Mitarbeiter"
end
