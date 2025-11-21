defmodule LehrstuhlWeb.StudentLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Persons

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    # Hier wird nun die mächtige get_student! Funktion aus Schritt 1 aufgerufen
    student = Persons.get_student!(id)

    # Sicherheits-Check: Falls Assoziationen nil sind, leere Listen verwenden
    klausurergebnisse = student.klausurergebnisse || []
    seminarergebnisse = student.seminarergebnisse || []
    ergebnisse_abschlussarbeiten = student.ergebnisse_abschlussarbeiten || []

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:student, student)
     |> assign(:klausurergebnisse, klausurergebnisse)
     |> assign(:seminarergebnisse, seminarergebnisse)
     |> assign(:ergebnisse_abschlussarbeiten, ergebnisse_abschlussarbeiten)}
  end

  defp page_title(:show), do: "Studentenakte"
  defp page_title(:edit), do: "Student bearbeiten"
end
