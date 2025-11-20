defmodule LehrstuhlWeb.ModulLive.FormComponent do
  use LehrstuhlWeb, :live_component

  alias Lehrstuhl.Klausuren
  alias Lehrstuhl.Persons

  @impl true
  def render(assigns) do
    mitarbeiter = Persons.list_mitarbeiter()
    all_mitarbeiter = Enum.map(mitarbeiter, &{&1.email, &1.id})
    assigns = assign(assigns, all_mitarbeiter: all_mitarbeiter)

    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage modul records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="modul-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input
          field={@form[:mitarbeiter_id]}
          type="select"
          options={@all_mitarbeiter}
          label="Betreuer"
        />
        <.input
          field={@form[:lehrstuhlinhaber_id]}
          type="select"
          options={@all_mitarbeiter}
          label="Lehrstuhlinhaber"
        />
        <:actions>
          <.button phx-disable-with="Saving...">Save Modul</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{modul: modul} = assigns, socket) do
    changeset = Klausuren.change_modul(modul)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"modul" => modul_params}, socket) do
    changeset =
      socket.assigns.modul
      |> Klausuren.change_modul(modul_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"modul" => modul_params}, socket) do
    save_modul(socket, socket.assigns.action, modul_params)
  end

  defp save_modul(socket, :edit, modul_params) do
    case Klausuren.update_modul(socket.assigns.modul, modul_params) do
      {:ok, modul} ->
        notify_parent({:saved, modul})

        {:noreply,
         socket
         |> put_flash(:info, "Modul updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_modul(socket, :new, modul_params) do
    case Klausuren.create_modul(modul_params) do
      {:ok, modul} ->
        notify_parent({:saved, modul})

        {:noreply,
         socket
         |> put_flash(:info, "Modul created successfully")
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
