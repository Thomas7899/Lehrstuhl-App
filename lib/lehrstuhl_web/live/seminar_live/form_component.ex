defmodule LehrstuhlWeb.SeminarLive.FormComponent do
  use LehrstuhlWeb, :live_component

  alias Lehrstuhl.Persons
  alias Lehrstuhl.Seminare

  @impl true
  def render(assigns) do
    mitarbeiter = Persons.list_mitarbeiter()
    all_mitarbeiter = Enum.map(mitarbeiter, &{&1.email, &1.id})

    abstrakte_seminare = Seminare.list_abstrakte_seminare()
    all_abstrakte_seminare = Enum.map(abstrakte_seminare, &{&1.thema, &1.id})

    assigns =
      assign(assigns,
        all_mitarbeiter: all_mitarbeiter,
        all_abstrakte_seminare: all_abstrakte_seminare
      )

    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage seminar records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="seminar-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input
          field={@form[:abstraktes_seminar_id]}
          type="select"
          options={@all_abstrakte_seminare}
          label="Abstraktes seminar"
        />
        <.input
          field={@form[:mitarbeiter_id]}
          type="select"
          options={@all_mitarbeiter}
          label="Mitarbeiter"
        />
        <.input field={@form[:titel]} type="text" label="Titel" />
        <.input field={@form[:aufnahmekapazitaet]} type="number" label="Aufnahmekapazitaet" />
        <.input field={@form[:semester]} type="text" label="Semester" />
        <.input field={@form[:praesenzdatum]} type="date" label="Praesenzdatum" />
        <.input field={@form[:ort]} type="text" label="Ort" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Seminar</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{seminar: seminar} = assigns, socket) do
    changeset = Seminare.change_seminar(seminar)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"seminar" => seminar_params}, socket) do
    changeset =
      socket.assigns.seminar
      |> Seminare.change_seminar(seminar_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"seminar" => seminar_params}, socket) do
    save_seminar(socket, socket.assigns.action, seminar_params)
  end

  defp save_seminar(socket, :edit, seminar_params) do
    case Seminare.update_seminar(socket.assigns.seminar, seminar_params) do
      {:ok, seminar} ->
        notify_parent({:saved, seminar})

        {:noreply,
         socket
         |> put_flash(:info, "Seminar updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_seminar(socket, :new, seminar_params) do
    case Seminare.create_seminar(seminar_params) do
      {:ok, seminar} ->
        notify_parent({:saved, seminar})

        {:noreply,
         socket
         |> put_flash(:info, "Seminar created successfully")
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
