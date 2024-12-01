defmodule LehrstuhlWeb.AbstrakteAbschlussarbeitenLive.Index do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten
  alias Lehrstuhl.Abschlussarbeiten.AbstrakteAbschlussarbeiten

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :abstrakte_abschlussarbeiten_collection, Abschlussarbeiten.list_abstrakte_abschlussarbeiten())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Abstrakte abschlussarbeiten")
    |> assign(:abstrakte_abschlussarbeiten, Abschlussarbeiten.get_abstrakte_abschlussarbeiten!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Neue abstrakte Abschlussarbeit erstellen")
    |> assign(:abstrakte_abschlussarbeiten, %AbstrakteAbschlussarbeiten{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Abstrakte Abschlussarbeiten")
    |> assign(:abstrakte_abschlussarbeiten, nil)
  end

  @impl true
  def handle_info({LehrstuhlWeb.AbstrakteAbschlussarbeitenLive.FormComponent, {:saved, abstrakte_abschlussarbeiten}}, socket) do
    {:noreply, stream_insert(socket, :abstrakte_abschlussarbeiten_collection, abstrakte_abschlussarbeiten)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    abstrakte_abschlussarbeiten = Abschlussarbeiten.get_abstrakte_abschlussarbeiten!(id)
    {:ok, _} = Abschlussarbeiten.delete_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten)

    {:noreply, stream_delete(socket, :abstrakte_abschlussarbeiten_collection, abstrakte_abschlussarbeiten)}
  end
end
