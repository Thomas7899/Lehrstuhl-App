defmodule LehrstuhlWeb.KlausurergebnisLive.Index do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Klausuren
  alias Lehrstuhl.Klausuren.Klausurergebnis

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :klausurergebnisse, Klausuren.list_klausurergebnisse())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Klausurergebnis")
    |> assign(:klausurergebnis, Klausuren.get_klausurergebnis!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Klausurergebnis")
    |> assign(:klausurergebnis, %Klausurergebnis{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Klausurergebnisse")
    |> assign(:klausurergebnis, nil)
  end

  @impl true
  def handle_info(
        {LehrstuhlWeb.KlausurergebnisLive.FormComponent, {:saved, klausurergebnis}},
        socket
      ) do
    {:noreply, stream_insert(socket, :klausurergebnisse, klausurergebnis)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    klausurergebnis = Klausuren.get_klausurergebnis!(id)
    {:ok, _} = Klausuren.delete_klausurergebnis(klausurergebnis)

    {:noreply, stream_delete(socket, :klausurergebnisse, klausurergebnis)}
  end
end
