defmodule LehrstuhlWeb.MitarbeiterLive.Index do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Persons
  alias Lehrstuhl.Persons.Mitarbeiter

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :mitarbeiter_collection, Persons.list_mitarbeiter())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Mitarbeiter")
    |> assign(:mitarbeiter, Persons.get_mitarbeiter!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Mitarbeiter")
    |> assign(:mitarbeiter, %Mitarbeiter{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Mitarbeiter")
    |> assign(:mitarbeiter, nil)
  end

  @impl true
  def handle_info({LehrstuhlWeb.MitarbeiterLive.FormComponent, {:saved, mitarbeiter}}, socket) do
    {:noreply, stream_insert(socket, :mitarbeiter_collection, mitarbeiter)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    mitarbeiter = Persons.get_mitarbeiter!(id)
    {:ok, _} = Persons.delete_mitarbeiter(mitarbeiter)

    {:noreply, stream_delete(socket, :mitarbeiter_collection, mitarbeiter)}
  end
end
