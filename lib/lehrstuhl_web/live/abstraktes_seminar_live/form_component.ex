defmodule LehrstuhlWeb.AbstraktesSeminarLive.FormComponent do
  use LehrstuhlWeb, :live_component

  alias Lehrstuhl.Persons
  alias Lehrstuhl.Seminare

  @impl true
  def render(assigns) do
    mitarbeiter = Persons.list_mitarbeiter()
    all_mitarbeiter = Enum.map(mitarbeiter, &{&1.email, &1.id})
    assigns = assign(assigns, all_mitarbeiter: all_mitarbeiter)

    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage abstraktes_seminar records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="abstraktes_seminar-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input
          field={@form[:mitarbeiter_id]}
          type="select"
          options={@all_mitarbeiter}
          label="Urheber"
        />
        <.input field={@form[:thema]} type="text" label="Thema" />
        <.input field={@form[:beschreibung]} type="text" label="Beschreibung" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Abstraktes seminar</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{abstraktes_seminar: abstraktes_seminar} = assigns, socket) do
    changeset = Seminare.change_abstraktes_seminar(abstraktes_seminar)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"abstraktes_seminar" => abstraktes_seminar_params}, socket) do
    changeset =
      socket.assigns.abstraktes_seminar
      |> Seminare.change_abstraktes_seminar(abstraktes_seminar_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"abstraktes_seminar" => abstraktes_seminar_params}, socket) do
    save_abstraktes_seminar(socket, socket.assigns.action, abstraktes_seminar_params)
  end

  defp save_abstraktes_seminar(socket, :edit, abstraktes_seminar_params) do
    case Seminare.update_abstraktes_seminar(
           socket.assigns.abstraktes_seminar,
           abstraktes_seminar_params
         ) do
      {:ok, abstraktes_seminar} ->
        notify_parent({:saved, abstraktes_seminar})

        {:noreply,
         socket
         |> put_flash(:info, "Abstraktes seminar updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_abstraktes_seminar(socket, :new, abstraktes_seminar_params) do
    case Seminare.create_abstraktes_seminar(abstraktes_seminar_params) do
      {:ok, abstraktes_seminar} ->
        notify_parent({:saved, abstraktes_seminar})

        {:noreply,
         socket
         |> put_flash(:info, "Abstraktes seminar created successfully")
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
