defmodule LehrstuhlWeb.StudentLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Persons
  alias Lehrstuhl.Repo

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    student = Persons.get_student!(id)
            |> Repo.preload(:konkrete_abschlussarbeiten)
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:student, student)}

  end

  defp page_title(:show), do: "Show Student"
  defp page_title(:edit), do: "Edit Student"
end
