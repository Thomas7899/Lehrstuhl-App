defmodule LehrstuhlWeb.FeaturedAbschlussarbeitenLive do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten

  def mount(_params, _session, socket) do
    socket =
      assign(socket, abschlussarbeiten: Abschlussarbeiten.list_abstrakte_abschlussarbeiten())
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
     <div :for={abschlussarbeiten <- @konkrete_abschlussarbeiten} >
     <div class="flex justify-between items-center">
    <div><%= abschlussarbeiten.forschungsprojekt %></div>
    </div>
    </div>
    """
  end
end
