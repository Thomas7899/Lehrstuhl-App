defmodule LehrstuhlWeb.KlausurLive.Index do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Klausuren
  alias Lehrstuhl.Klausuren.Klausur

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :klausuren, Klausuren.list_klausuren())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Klausur")
    |> assign(:klausur, Klausuren.get_klausur!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Klausur")
    |> assign(:klausur, %Klausur{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Klausuren")
    |> assign(:klausur, nil)
  end

  @impl true
  def handle_info({LehrstuhlWeb.KlausurLive.FormComponent, {:saved, klausur}}, socket) do
    {:noreply, stream_insert(socket, :klausuren, klausur)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    klausur = Klausuren.get_klausur!(id)
    {:ok, _} = Klausuren.delete_klausur(klausur)

    {:noreply, stream_delete(socket, :klausuren, klausur)}
  end
end
