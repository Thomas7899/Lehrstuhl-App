defmodule LehrstuhlWeb.KlausurLive.FormComponent do
  use LehrstuhlWeb, :live_component

  alias Lehrstuhl.Klausuren

  @impl true
  def render(assigns) do
    module = Klausuren.list_module()
    all_module = Enum.map(module, &{&1.name, &1.id})
    assigns = assign(assigns, all_module: all_module)

    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage klausur records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="klausur-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:kenner]} type="text" label="Kenner" />
        <.input field={@form[:beschreibung]} type="text" label="Beschreibung" />
        <.input field={@form[:punkteGesamt]} type="number" label="Punktegesamt" />
        <.input field={@form[:semester]} type="text" label="Semester" />
        <.input field={@form[:praesenzdatum]} type="date" label="Praesenzdatum" />
        <.input field={@form[:ort]} type="text" label="Ort" />
        <.input field={@form[:modul_id]} type="select" options={@all_module} label="Modul" />

        <:actions>
          <.button phx-disable-with="Saving...">Save Klausur</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{klausur: klausur} = assigns, socket) do
    changeset = Klausuren.change_klausur(klausur)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"klausur" => klausur_params}, socket) do
    changeset =
      socket.assigns.klausur
      |> Klausuren.change_klausur(klausur_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"klausur" => klausur_params}, socket) do
    save_klausur(socket, socket.assigns.action, klausur_params)
  end

  defp save_klausur(socket, :edit, klausur_params) do
    case Klausuren.update_klausur(socket.assigns.klausur, klausur_params) do
      {:ok, klausur} ->
        notify_parent({:saved, klausur})

        {:noreply,
         socket
         |> put_flash(:info, "Klausur updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_klausur(socket, :new, klausur_params) do
    case Klausuren.create_klausur(klausur_params) do
      {:ok, klausur} ->
        notify_parent({:saved, klausur})

        {:noreply,
         socket
         |> put_flash(:info, "Klausur created successfully")
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
