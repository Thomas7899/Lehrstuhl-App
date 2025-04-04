defmodule LehrstuhlWeb.StudentLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Persons
  

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    student = Persons.get_student!(id)

    klausurergebnisse = student.klausurergebnisse || []
    seminarergebnisse = student.seminarergebnisse || []
    ergebnisse = student.ergebnisse_abschlussarbeiten || []

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:student, student)
     |> assign(:klausurergebnisse, klausurergebnisse)
     |> assign(:seminarergebnisse, seminarergebnisse)
     |> assign(:ergebnisse_abschlussarbeiten, ergebnisse)}
  end

  defp page_title(:show), do: "Show Student"
  defp page_title(:edit), do: "Edit Student"
end
