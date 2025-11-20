defmodule LehrstuhlWeb.SeminarLive.Index do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Seminare
  alias Lehrstuhl.Seminare.Seminar

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :seminare, Seminare.list_seminare())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Seminar")
    |> assign(:seminar, Seminare.get_seminar!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Seminar")
    |> assign(:seminar, %Seminar{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Seminare")
    |> assign(:seminar, nil)
  end

  @impl true
  def handle_info({LehrstuhlWeb.SeminarLive.FormComponent, {:saved, seminar}}, socket) do
    {:noreply, stream_insert(socket, :seminare, seminar)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    seminar = Seminare.get_seminar!(id)
    {:ok, _} = Seminare.delete_seminar(seminar)

    {:noreply, stream_delete(socket, :seminare, seminar)}
  end
end
