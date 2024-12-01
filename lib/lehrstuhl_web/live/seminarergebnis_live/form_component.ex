defmodule LehrstuhlWeb.SeminarergebnisLive.FormComponent do
  use LehrstuhlWeb, :live_component

  alias Lehrstuhl.Persons
  alias Lehrstuhl.Seminare

  @impl true
  def render(assigns) do
    students = Persons.list_students()
    all_students = Enum.map(students, &{&1.matrikelnummer, &1.id})

    # TODO: Alle Seminare sollte nur die noch laufenden Seminare für das Semester anzeigen
    seminare = Seminare.list_seminare()
    all_seminare = Enum.map(seminare, &{&1.titel, &1.id})
    assigns = assign(assigns, all_students: all_students, all_seminare: all_seminare)

    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage seminarergebnis records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="seminarergebnis-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:fachvortrag_titel]} type="text" label="Fachvortrag titel" />
        <.input field={@form[:student_id]} type="select" options={@all_students} label="Student" />
        <.input field={@form[:seminar_id]} type="select" options={@all_seminare} label="Seminar" />
        <.input field={@form[:fachvortrag_datum]} type="date" label="Fachvortrag datum" />
        <.input field={@form[:fachvortrag_start]} type="time" label="Fachvortrag start" />
        <.input field={@form[:fachvortrag_stop]} type="time" label="Fachvortrag stop" />
        <.input
          field={@form[:fachvortrag_notenvorschlag]}
          type="number"
          label="Fachvortrag notenvorschlag"
          step="any"
        />
        <.input
          field={@form[:fachvortrag_teilnote]}
          type="number"
          label="Fachvortrag teilnote"
          step="any"
        />
        <.input field={@form[:seminararbeit_titel]} type="text" label="Seminararbeit titel" />
        <.input
          field={@form[:seminararbeit_einreichung]}
          type="date"
          label="Seminararbeit einreichung"
        />
        <.input
          field={@form[:seminararbeit_notenvorschlag]}
          type="number"
          label="Seminararbeit notenvorschlag"
          step="any"
        />
        <.input
          field={@form[:seminararbeit_teilnote]}
          type="number"
          label="Seminararbeit teilnote"
          step="any"
        />
        <.input field={@form[:gesamtergebnis]} type="number" label="Gesamtergebnis" step="any" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Seminarergebnis</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{seminarergebnis: seminarergebnis} = assigns, socket) do
    changeset = Seminare.change_seminarergebnis(seminarergebnis)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"seminarergebnis" => seminarergebnis_params}, socket) do
    changeset =
      socket.assigns.seminarergebnis
      |> Seminare.change_seminarergebnis(seminarergebnis_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"seminarergebnis" => seminarergebnis_params}, socket) do
    save_seminarergebnis(socket, socket.assigns.action, seminarergebnis_params)
  end

  defp save_seminarergebnis(socket, :edit, seminarergebnis_params) do
    case Seminare.update_seminarergebnis(socket.assigns.seminarergebnis, seminarergebnis_params) do
      {:ok, seminarergebnis} ->
        notify_parent({:saved, seminarergebnis})

        {:noreply,
         socket
         |> put_flash(:info, "Seminarergebnis updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_seminarergebnis(socket, :new, seminarergebnis_params) do
    case Seminare.create_seminarergebnis(seminarergebnis_params) do
      {:ok, seminarergebnis} ->
        notify_parent({:saved, seminarergebnis})

        {:noreply,
         socket
         |> put_flash(:info, "Seminarergebnis created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
