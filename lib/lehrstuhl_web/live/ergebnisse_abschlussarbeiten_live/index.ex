defmodule LehrstuhlWeb.ErgebnisseAbschlussarbeitenLive.Index do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten
  alias Lehrstuhl.Abschlussarbeiten.ErgebnisseAbschlussarbeiten

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :ergebnisse_abschlussarbeiten_collection, Abschlussarbeiten.list_ergebnisse_abschlussarbeiten())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Ergebnisse abschlussarbeiten")
    |> assign(:ergebnisse_abschlussarbeiten, Abschlussarbeiten.get_ergebnisse_abschlussarbeiten!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Neue Ergebnisse Abschlussarbeiten")
    |> assign(:ergebnisse_abschlussarbeiten, %ErgebnisseAbschlussarbeiten{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Ergebnisse Abschlussarbeiten")
    |> assign(:ergebnisse_abschlussarbeiten, nil)
  end

  @impl true
  def handle_info({LehrstuhlWeb.ErgebnisseAbschlussarbeitenLive.FormComponent, {:saved, ergebnisse_abschlussarbeiten}}, socket) do
    {:noreply, stream_insert(socket, :ergebnisse_abschlussarbeiten_collection, ergebnisse_abschlussarbeiten)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    ergebnisse_abschlussarbeiten = Abschlussarbeiten.get_ergebnisse_abschlussarbeiten!(id)
    {:ok, _} = Abschlussarbeiten.delete_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten)

    {:noreply, stream_delete(socket, :ergebnisse_abschlussarbeiten_collection, ergebnisse_abschlussarbeiten)}
  end
end
