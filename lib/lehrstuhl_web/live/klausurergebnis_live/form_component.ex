defmodule LehrstuhlWeb.KlausurergebnisLive.FormComponent do
  use LehrstuhlWeb, :live_component

  alias Lehrstuhl.Klausuren
  alias Lehrstuhl.Persons

  @impl true
  def render(assigns) do
    # check
    studenten = Persons.list_students()
    all_studenten = Enum.map(studenten, &{&1.email, &1.id})

    klausuren = Klausuren.list_klausuren()
    all_klausuren = Enum.map(klausuren, &{&1.kenner, &1.id})

    assigns = assign(assigns, all_studenten: all_studenten, all_klausuren: all_klausuren)

    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage klausurergebnis records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="klausurergebnis-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <!-- <.input field={@form[:presenzdatum_id]} type="select" options={@my_options} label="Datum" /> -->
        <.input field={@form[:punkte]} type="number" label="Punkte" />
        <.input field={@form[:student_id]} type="select" options={@all_studenten} label="Student" />
        <.input field={@form[:klausur_id]} type="select" options={@all_klausuren} label="Klausur" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Klausurergebnis</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{klausurergebnis: klausurergebnis} = assigns, socket) do
    changeset = Klausuren.change_klausurergebnis(klausurergebnis)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"klausurergebnis" => klausurergebnis_params}, socket) do
    changeset =
      socket.assigns.klausurergebnis
      |> Klausuren.change_klausurergebnis(klausurergebnis_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"klausurergebnis" => klausurergebnis_params}, socket) do
    save_klausurergebnis(socket, socket.assigns.action, klausurergebnis_params)
  end

  defp save_klausurergebnis(socket, :edit, klausurergebnis_params) do
    case Klausuren.update_klausurergebnis(socket.assigns.klausurergebnis, klausurergebnis_params) do
      {:ok, klausurergebnis} ->
        notify_parent({:saved, klausurergebnis})

        {:noreply,
         socket
         |> put_flash(:info, "Klausurergebnis updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_klausurergebnis(socket, :new, klausurergebnis_params) do
    case Klausuren.create_klausurergebnis(klausurergebnis_params) do
      {:ok, klausurergebnis} ->
        notify_parent({:saved, klausurergebnis})

        {:noreply,
         socket
         |> put_flash(:info, "Klausurergebnis created successfully")
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
