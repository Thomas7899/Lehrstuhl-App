defmodule LehrstuhlWeb.SeminarergebnisLive.Index do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Seminare
  alias Lehrstuhl.Seminare.Seminarergebnis

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :seminarergebnisse, Seminare.list_seminarergebnisse())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Seminarergebnis")
    |> assign(:seminarergebnis, Seminare.get_seminarergebnis!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Seminarergebnis")
    |> assign(:seminarergebnis, %Seminarergebnis{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Seminarergebnisse")
    |> assign(:seminarergebnis, nil)
  end

  @impl true
  def handle_info(
        {LehrstuhlWeb.SeminarergebnisLive.FormComponent, {:saved, seminarergebnis}},
        socket
      ) do
    {:noreply, stream_insert(socket, :seminarergebnisse, seminarergebnis)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    seminarergebnis = Seminare.get_seminarergebnis!(id)
    {:ok, _} = Seminare.delete_seminarergebnis(seminarergebnis)

    {:noreply, stream_delete(socket, :seminarergebnisse, seminarergebnis)}
  end
end
