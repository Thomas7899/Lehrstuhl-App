defmodule LehrstuhlWeb.AbstrakteAbschlussarbeitenLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten


  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
def handle_params(%{"id" => id}, _, socket) do
  abstrakte_abschlussarbeit = Abschlussarbeiten.get_abstrakte_abschlussarbeiten!(id)
  konkrete_abschlussarbeiten = Abschlussarbeiten.list_konkrete_abschlussarbeiten_for_abstrakte(id)

  {:noreply,
   socket
   |> assign(:page_title, page_title(socket.assigns.live_action))
   |> assign(:abstrakte_abschlussarbeiten, abstrakte_abschlussarbeit)
   |> assign(:konkrete_abschlussarbeiten, konkrete_abschlussarbeiten)}
end


  defp page_title(:show), do: "Show abstrakte Abschlussarbeiten"
  defp page_title(:edit), do: "Edit abstrakte Abschlussarbeiten"
end
