defmodule LehrstuhlWeb.MitarbeiterLive.FormComponent do
  use LehrstuhlWeb, :live_component

  alias Lehrstuhl.Persons

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage mitarbeiter records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="mitarbeiter-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:email]} type="text" label="Email" />
        <.input field={@form[:nachname]} type="text" label="Nachname" />
        <.input field={@form[:vorname]} type="text" label="Vorname" />
        <.input
          field={@form[:rolle]}
          type="select"
          label="Rolle"
          prompt="Choose a value"
          options={Ecto.Enum.values(Lehrstuhl.Persons.Mitarbeiter, :rolle)}
        />
        <:actions>
          <.button phx-disable-with="Saving...">Save Mitarbeiter</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{mitarbeiter: mitarbeiter} = assigns, socket) do
    changeset = Persons.change_mitarbeiter(mitarbeiter)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"mitarbeiter" => mitarbeiter_params}, socket) do
    changeset =
      socket.assigns.mitarbeiter
      |> Persons.change_mitarbeiter(mitarbeiter_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"mitarbeiter" => mitarbeiter_params}, socket) do
    save_mitarbeiter(socket, socket.assigns.action, mitarbeiter_params)
  end

  defp save_mitarbeiter(socket, :edit, mitarbeiter_params) do
    case Persons.update_mitarbeiter(socket.assigns.mitarbeiter, mitarbeiter_params) do
      {:ok, mitarbeiter} ->
        notify_parent({:saved, mitarbeiter})

        {:noreply,
         socket
         |> put_flash(:info, "Mitarbeiter updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_mitarbeiter(socket, :new, mitarbeiter_params) do
    case Persons.create_mitarbeiter(mitarbeiter_params) do
      {:ok, mitarbeiter} ->
        notify_parent({:saved, mitarbeiter})

        {:noreply,
         socket
         |> put_flash(:info, "Mitarbeiter created successfully")
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
