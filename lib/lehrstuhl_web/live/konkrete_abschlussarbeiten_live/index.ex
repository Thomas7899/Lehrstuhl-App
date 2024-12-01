defmodule LehrstuhlWeb.KonkreteAbschlussarbeitenLive.Index do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten
  alias Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :konkrete_abschlussarbeiten_collection, Abschlussarbeiten.list_konkrete_abschlussarbeiten())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit konkrete Abschlussarbeit")
    |> assign(:konkrete_abschlussarbeiten, Abschlussarbeiten.get_konkrete_abschlussarbeiten!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Neue konkrete Abschlussarbeit erstellen")
    |> assign(:konkrete_abschlussarbeiten, %KonkreteAbschlussarbeiten{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Konkrete Abschlussarbeiten")
    |> assign(:konkrete_abschlussarbeiten, nil)
  end

  @impl true
  def handle_info({LehrstuhlWeb.KonkreteAbschlussarbeitenLive.FormComponent, {:saved, konkrete_abschlussarbeiten}}, socket) do
    {:noreply, stream_insert(socket, :konkrete_abschlussarbeiten_collection, konkrete_abschlussarbeiten)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    konkrete_abschlussarbeiten = Abschlussarbeiten.get_konkrete_abschlussarbeiten!(id)
    {:ok, _} = Abschlussarbeiten.delete_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten)

    {:noreply, stream_delete(socket, :konkrete_abschlussarbeiten_collection, konkrete_abschlussarbeiten)}
  end
end
