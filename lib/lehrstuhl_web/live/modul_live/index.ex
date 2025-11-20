defmodule LehrstuhlWeb.ModulLive.Index do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Klausuren
  alias Lehrstuhl.Klausuren.Modul

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :module, Klausuren.list_module())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Modul")
    |> assign(:modul, Klausuren.get_modul!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Modul")
    |> assign(:modul, %Modul{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Module")
    |> assign(:modul, nil)
  end

  @impl true
  def handle_info({LehrstuhlWeb.ModulLive.FormComponent, {:saved, modul}}, socket) do
    {:noreply, stream_insert(socket, :module, modul)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    modul = Klausuren.get_modul!(id)
    {:ok, _} = Klausuren.delete_modul(modul)

    {:noreply, stream_delete(socket, :module, modul)}
  end
end
