defmodule LehrstuhlWeb.StudentLive.FormComponent do
  use LehrstuhlWeb, :live_component

  alias Lehrstuhl.Persons

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage student records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="student-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:email]} type="text" label="Email" />
        <.input field={@form[:matrikelnummer]} type="text" label="Matrikelnummer" />
        <.input field={@form[:vorname]} type="text" label="Vorname" />
        <.input field={@form[:nachname]} type="text" label="Nachname" />
        <.input field={@form[:geburtsdatum]} type="date" label="Geburtsdatum" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Student</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{student: student} = assigns, socket) do
    changeset = Persons.change_student(student)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"student" => student_params}, socket) do
    changeset =
      socket.assigns.student
      |> Persons.change_student(student_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"student" => student_params}, socket) do
    save_student(socket, socket.assigns.action, student_params)
  end

  defp save_student(socket, :edit, student_params) do
    case Persons.update_student(socket.assigns.student, student_params) do
      {:ok, student} ->
        notify_parent({:saved, student})

        {:noreply,
         socket
         |> put_flash(:info, "Student updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_student(socket, :new, student_params) do
    case Persons.create_student(student_params) do
      {:ok, student} ->
        notify_parent({:saved, student})

        {:noreply,
         socket
         |> put_flash(:info, "Student created successfully")
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
