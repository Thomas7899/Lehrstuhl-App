defmodule LehrstuhlWeb.AbstraktesSeminarLive.Index do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Seminare
  alias Lehrstuhl.Seminare.AbstraktesSeminar

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :abstrakte_seminare, Seminare.list_abstrakte_seminare())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Abstraktes seminar")
    |> assign(:abstraktes_seminar, Seminare.get_abstraktes_seminar!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Abstraktes seminar")
    |> assign(:abstraktes_seminar, %AbstraktesSeminar{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Abstrakte seminare")
    |> assign(:abstraktes_seminar, nil)
  end

  @impl true
  def handle_info(
        {LehrstuhlWeb.AbstraktesSeminarLive.FormComponent, {:saved, abstraktes_seminar}},
        socket
      ) do
    {:noreply, stream_insert(socket, :abstrakte_seminare, abstraktes_seminar)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    abstraktes_seminar = Seminare.get_abstraktes_seminar!(id)
    {:ok, _} = Seminare.delete_abstraktes_seminar(abstraktes_seminar)

    {:noreply, stream_delete(socket, :abstrakte_seminare, abstraktes_seminar)}
  end
end
